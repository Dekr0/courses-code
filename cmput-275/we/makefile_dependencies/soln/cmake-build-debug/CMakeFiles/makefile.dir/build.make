# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.16

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\Program Files\CLion 2020.1.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "D:\Program Files\CLion 2020.1.2\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\Dekr0\cmput275\we\makefile_dependencies\soln

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Dekr0\cmput275\we\makefile_dependencies\soln\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/makefile.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/makefile.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/makefile.dir/flags.make

CMakeFiles/makefile.dir/makefile_dependencies.cpp.obj: CMakeFiles/makefile.dir/flags.make
CMakeFiles/makefile.dir/makefile_dependencies.cpp.obj: ../makefile_dependencies.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Dekr0\cmput275\we\makefile_dependencies\soln\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/makefile.dir/makefile_dependencies.cpp.obj"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe"  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\makefile.dir\makefile_dependencies.cpp.obj -c D:\Dekr0\cmput275\we\makefile_dependencies\soln\makefile_dependencies.cpp

CMakeFiles/makefile.dir/makefile_dependencies.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/makefile.dir/makefile_dependencies.cpp.i"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Dekr0\cmput275\we\makefile_dependencies\soln\makefile_dependencies.cpp > CMakeFiles\makefile.dir\makefile_dependencies.cpp.i

CMakeFiles/makefile.dir/makefile_dependencies.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/makefile.dir/makefile_dependencies.cpp.s"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Dekr0\cmput275\we\makefile_dependencies\soln\makefile_dependencies.cpp -o CMakeFiles\makefile.dir\makefile_dependencies.cpp.s

# Object files for target makefile
makefile_OBJECTS = \
"CMakeFiles/makefile.dir/makefile_dependencies.cpp.obj"

# External object files for target makefile
makefile_EXTERNAL_OBJECTS =

makefile.exe: CMakeFiles/makefile.dir/makefile_dependencies.cpp.obj
makefile.exe: CMakeFiles/makefile.dir/build.make
makefile.exe: CMakeFiles/makefile.dir/linklibs.rsp
makefile.exe: CMakeFiles/makefile.dir/objects1.rsp
makefile.exe: CMakeFiles/makefile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Dekr0\cmput275\we\makefile_dependencies\soln\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable makefile.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\makefile.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/makefile.dir/build: makefile.exe

.PHONY : CMakeFiles/makefile.dir/build

CMakeFiles/makefile.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\makefile.dir\cmake_clean.cmake
.PHONY : CMakeFiles/makefile.dir/clean

CMakeFiles/makefile.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Dekr0\cmput275\we\makefile_dependencies\soln D:\Dekr0\cmput275\we\makefile_dependencies\soln D:\Dekr0\cmput275\we\makefile_dependencies\soln\cmake-build-debug D:\Dekr0\cmput275\we\makefile_dependencies\soln\cmake-build-debug D:\Dekr0\cmput275\we\makefile_dependencies\soln\cmake-build-debug\CMakeFiles\makefile.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/makefile.dir/depend

