# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /home/dekr0/clion-2020.1.2/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/dekr0/clion-2020.1.2/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/pipe_writer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/pipe_writer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pipe_writer.dir/flags.make

CMakeFiles/pipe_writer.dir/writer.cpp.o: CMakeFiles/pipe_writer.dir/flags.make
CMakeFiles/pipe_writer.dir/writer.cpp.o: ../writer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pipe_writer.dir/writer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipe_writer.dir/writer.cpp.o -c /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/writer.cpp

CMakeFiles/pipe_writer.dir/writer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipe_writer.dir/writer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/writer.cpp > CMakeFiles/pipe_writer.dir/writer.cpp.i

CMakeFiles/pipe_writer.dir/writer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipe_writer.dir/writer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/writer.cpp -o CMakeFiles/pipe_writer.dir/writer.cpp.s

# Object files for target pipe_writer
pipe_writer_OBJECTS = \
"CMakeFiles/pipe_writer.dir/writer.cpp.o"

# External object files for target pipe_writer
pipe_writer_EXTERNAL_OBJECTS =

pipe_writer: CMakeFiles/pipe_writer.dir/writer.cpp.o
pipe_writer: CMakeFiles/pipe_writer.dir/build.make
pipe_writer: CMakeFiles/pipe_writer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable pipe_writer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pipe_writer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pipe_writer.dir/build: pipe_writer

.PHONY : CMakeFiles/pipe_writer.dir/build

CMakeFiles/pipe_writer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pipe_writer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pipe_writer.dir/clean

CMakeFiles/pipe_writer.dir/depend:
	cd /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/cmake-build-debug /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/cmake-build-debug /home/dekr0/Documents/cmput275/in-class/ipc-example/pipe/cmake-build-debug/CMakeFiles/pipe_writer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/pipe_writer.dir/depend

