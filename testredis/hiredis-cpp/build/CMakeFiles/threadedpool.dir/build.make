# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/ubuntu/cmake/bin/cmake

# The command to remove a file.
RM = /home/ubuntu/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/unitoss/unitoss-study/testredis/hiredis-cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/unitoss/unitoss-study/testredis/hiredis-cpp/build

# Include any dependencies generated for this target.
include CMakeFiles/threadedpool.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/threadedpool.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/threadedpool.dir/flags.make

CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o: CMakeFiles/threadedpool.dir/flags.make
CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o: ../src/examples/threadpool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/unitoss/unitoss-study/testredis/hiredis-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o -c /home/unitoss/unitoss-study/testredis/hiredis-cpp/src/examples/threadpool.cpp

CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/unitoss/unitoss-study/testredis/hiredis-cpp/src/examples/threadpool.cpp > CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.i

CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/unitoss/unitoss-study/testredis/hiredis-cpp/src/examples/threadpool.cpp -o CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.s

CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.requires:

.PHONY : CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.requires

CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.provides: CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.requires
	$(MAKE) -f CMakeFiles/threadedpool.dir/build.make CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.provides.build
.PHONY : CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.provides

CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.provides.build: CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o


# Object files for target threadedpool
threadedpool_OBJECTS = \
"CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o"

# External object files for target threadedpool
threadedpool_EXTERNAL_OBJECTS =

bin/threadedpool: CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o
bin/threadedpool: CMakeFiles/threadedpool.dir/build.make
bin/threadedpool: CMakeFiles/threadedpool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/unitoss/unitoss-study/testredis/hiredis-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/threadedpool"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/threadedpool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/threadedpool.dir/build: bin/threadedpool

.PHONY : CMakeFiles/threadedpool.dir/build

CMakeFiles/threadedpool.dir/requires: CMakeFiles/threadedpool.dir/src/examples/threadpool.cpp.o.requires

.PHONY : CMakeFiles/threadedpool.dir/requires

CMakeFiles/threadedpool.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/threadedpool.dir/cmake_clean.cmake
.PHONY : CMakeFiles/threadedpool.dir/clean

CMakeFiles/threadedpool.dir/depend:
	cd /home/unitoss/unitoss-study/testredis/hiredis-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/unitoss/unitoss-study/testredis/hiredis-cpp /home/unitoss/unitoss-study/testredis/hiredis-cpp /home/unitoss/unitoss-study/testredis/hiredis-cpp/build /home/unitoss/unitoss-study/testredis/hiredis-cpp/build /home/unitoss/unitoss-study/testredis/hiredis-cpp/build/CMakeFiles/threadedpool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/threadedpool.dir/depend

