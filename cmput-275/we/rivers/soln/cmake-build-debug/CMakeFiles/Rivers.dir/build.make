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
CMAKE_SOURCE_DIR = /home/dekr0/Documents/cmput275/we/rivers/soln

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dekr0/Documents/cmput275/we/rivers/soln/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Rivers.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Rivers.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Rivers.dir/flags.make

CMakeFiles/Rivers.dir/rivers.cpp.o: CMakeFiles/Rivers.dir/flags.make
CMakeFiles/Rivers.dir/rivers.cpp.o: ../rivers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dekr0/Documents/cmput275/we/rivers/soln/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Rivers.dir/rivers.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rivers.dir/rivers.cpp.o -c /home/dekr0/Documents/cmput275/we/rivers/soln/rivers.cpp

CMakeFiles/Rivers.dir/rivers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rivers.dir/rivers.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dekr0/Documents/cmput275/we/rivers/soln/rivers.cpp > CMakeFiles/Rivers.dir/rivers.cpp.i

CMakeFiles/Rivers.dir/rivers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rivers.dir/rivers.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dekr0/Documents/cmput275/we/rivers/soln/rivers.cpp -o CMakeFiles/Rivers.dir/rivers.cpp.s

# Object files for target Rivers
Rivers_OBJECTS = \
"CMakeFiles/Rivers.dir/rivers.cpp.o"

# External object files for target Rivers
Rivers_EXTERNAL_OBJECTS =

Rivers: CMakeFiles/Rivers.dir/rivers.cpp.o
Rivers: CMakeFiles/Rivers.dir/build.make
Rivers: CMakeFiles/Rivers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dekr0/Documents/cmput275/we/rivers/soln/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Rivers"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Rivers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Rivers.dir/build: Rivers

.PHONY : CMakeFiles/Rivers.dir/build

CMakeFiles/Rivers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Rivers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Rivers.dir/clean

CMakeFiles/Rivers.dir/depend:
	cd /home/dekr0/Documents/cmput275/we/rivers/soln/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dekr0/Documents/cmput275/we/rivers/soln /home/dekr0/Documents/cmput275/we/rivers/soln /home/dekr0/Documents/cmput275/we/rivers/soln/cmake-build-debug /home/dekr0/Documents/cmput275/we/rivers/soln/cmake-build-debug /home/dekr0/Documents/cmput275/we/rivers/soln/cmake-build-debug/CMakeFiles/Rivers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Rivers.dir/depend

