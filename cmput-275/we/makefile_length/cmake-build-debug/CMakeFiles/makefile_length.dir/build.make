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
CMAKE_SOURCE_DIR = /home/dekr0/Documents/cmput275/we/makefile_length

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dekr0/Documents/cmput275/we/makefile_length/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/makefile_length.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/makefile_length.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/makefile_length.dir/flags.make

CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.o: CMakeFiles/makefile_length.dir/flags.make
CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.o: ../soln/makefile_length.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dekr0/Documents/cmput275/we/makefile_length/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.o -c /home/dekr0/Documents/cmput275/we/makefile_length/soln/makefile_length.cpp

CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dekr0/Documents/cmput275/we/makefile_length/soln/makefile_length.cpp > CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.i

CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dekr0/Documents/cmput275/we/makefile_length/soln/makefile_length.cpp -o CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.s

# Object files for target makefile_length
makefile_length_OBJECTS = \
"CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.o"

# External object files for target makefile_length
makefile_length_EXTERNAL_OBJECTS =

makefile_length: CMakeFiles/makefile_length.dir/soln/makefile_length.cpp.o
makefile_length: CMakeFiles/makefile_length.dir/build.make
makefile_length: CMakeFiles/makefile_length.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dekr0/Documents/cmput275/we/makefile_length/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable makefile_length"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/makefile_length.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/makefile_length.dir/build: makefile_length

.PHONY : CMakeFiles/makefile_length.dir/build

CMakeFiles/makefile_length.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/makefile_length.dir/cmake_clean.cmake
.PHONY : CMakeFiles/makefile_length.dir/clean

CMakeFiles/makefile_length.dir/depend:
	cd /home/dekr0/Documents/cmput275/we/makefile_length/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dekr0/Documents/cmput275/we/makefile_length /home/dekr0/Documents/cmput275/we/makefile_length /home/dekr0/Documents/cmput275/we/makefile_length/cmake-build-debug /home/dekr0/Documents/cmput275/we/makefile_length/cmake-build-debug /home/dekr0/Documents/cmput275/we/makefile_length/cmake-build-debug/CMakeFiles/makefile_length.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/makefile_length.dir/depend

