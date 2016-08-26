package main

import (
	"common"
	"common/clog"
	"flag"
	"fmt"
	"reflect"
	"udr"
)

const PNAME = "cdrgen"

var (
	log       = clog.GetLogger()
	rabbitMgr = common.NewRabbitManager()
)

func main() {
	isDaemon := flag.Bool("d", false, "Daemon mode. subscribe request from web")
	flag.Parse()

	log.Info("START CDR GENERATOR...")

	defer rabbitMgr.CloseChanRabbit()
	defer rabbitMgr.CloseConnRabbit()

	if *isDaemon {
		log.Info("Running Daemon mode...")
		setRecvQueue()
		runDaemon()

	} else {
		procCh := make(chan bool, 100)
		processUdrGen(1, udr.MakeRandomUdr, procCh)
		<-procCh

	}
}

func init() {
	common.ReadConfigFile(PNAME)
	conf := common.GetConfig()
	// init log
	clog.InitWith(PNAME, conf.Logname, conf.Logdir, conf.Loglevel)

	// rabbit publisher connect
	rabbitMgr.ConnectRabbit(
		conf.Rabbithost,
		conf.Rabbitport,
		conf.Rabbituser,
		conf.Rabbitpw)
	rabbitMgr.UdrSendQueueDeclare(conf.Udrqueue)
}

func setRecvQueue() {
	conf := common.GetConfig()
	rabbitMgr.ReqRecvQueueDeclare(conf.Reqreciever)
}

func runDaemon() {
	fmt.Println("run daemon mode")

	msgs, err := rabbitMgr.ConsumeQueue()
	if err != nil {
		log.Panicf("Fail to Consume Queue...[%v]", err)
	}

	// make blocking for get rabbitmq msessages
	forever := make(chan bool)

	// messgae processing main loop
	go processUdrReq(msgs)

	log.Info("Waiting for UDR request messages...")
	<-forever
}

func processUdrReq(msgs common.QueMsg) {
	procCh := make(chan bool, 100)

	for d := range msgs {
		log.Infof("Received a message: %s %v", d.Body, reflect.TypeOf(d.Body))

		reqMsg, err := common.UdrReqMsgParse(d.Body)
		if err != nil {
			log.Errorf("Fail to parse UDR request message => %v", err)
			d.Reject(false)
			continue
		}

		var udrFunc func() (udr.UdrRaw, error)

		switch reqMsg.ErrorType {
		case common.NORMAL:
			log.Info("Generate Normal UDR...")
			udrFunc = udr.MakeRandomUdr
		case common.TIME_ERR:
			log.Info("Generate Time Error UDR...")
			udrFunc = udr.MakeTimeErrUdr
		case common.EUI_ERR:
			log.Info("Generate EUI Error UDR...")
			udrFunc = udr.MakeEuiErrUdr
		case common.FMT_ERR:
			log.Info("Generate Format Error UDR...")
			udrFunc = udr.MakeFmtErrUdr
		}

		go processUdrGen(reqMsg.Count, udrFunc, procCh)
		go common.ResponseAck(d, procCh)
	}
}

func processUdrGen(udrCnt int, procFunc func() (udr.UdrRaw, error), procCh chan bool) {
	for i := 0; i < udrCnt; i++ {
		randUdr, err := procFunc()
		if err != nil {
			log.Errorf("Fail to make random udr: [%v]", err)
			procCh <- false
		}

		fmt.Printf("random UDR %v\n", randUdr)

		jsonUdr, err := randUdr.ConvToJsonStr()
		if err != nil {
			log.Errorf("Udr to Json failed: UDR: [%v] JSON: [%v]", randUdr, err)
			procCh <- false
		}

		fmt.Printf("random JSON UDR %v\n", jsonUdr)

		err = rabbitMgr.PublishToQueue(jsonUdr)
		if err != nil {
			log.Errorf("UDR message is not send: %v", err)
			procCh <- false
		}

		procCh <- true
	}
}
