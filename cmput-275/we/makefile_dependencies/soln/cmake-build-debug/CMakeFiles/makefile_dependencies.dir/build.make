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
CMAKE_SOURCE_DIR = /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/makefile_dependencies.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/makefile_dependencies.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/makefile_dependencies.dir/flags.make

CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.o: CMakeFiles/makefile_dependencies.dir/flags.make
CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.o: ../makefile_dependencies.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.o -c /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/makefile_dependencies.cpp

CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/makefile_dependencies.cpp > CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.i

CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/makefile_dependencies.cpp -o CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.s

# Object files for target makefile_dependencies
makefile_dependencies_OBJECTS = \
"CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.o"

# External object files for target makefile_dependencies
makefile_dependencies_EXTERNAL_OBJECTS =

makefile_dependencies: CMakeFiles/makefile_dependencies.dir/makefile_dependencies.cpp.o
makefile_dependencies: CMakeFiles/makefile_dependencies.dir/build.make
makefile_dependencies: CMakeFiles/makefile_dependencies.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable makefile_dependencies"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/makefile_dependencies.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/makefile_dependencies.dir/build: makefile_dependencies

.PHONY : CMakeFiles/makefile_dependencies.dir/build

CMakeFiles/makefile_dependencies.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/makefile_dependencies.dir/cmake_clean.cmake
.PHONY : CMakeFiles/makefile_dependencies.dir/clean

CMakeFiles/makefile_dependencies.dir/depend:
	cd /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/cmake-build-debug /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/cmake-build-debug /home/dekr0/Documents/cmput275/we/makefile_dependencies/soln/cmake-build-debug/CMakeFiles/makefile_dependencies.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/makefile_dependencies.dir/depend
