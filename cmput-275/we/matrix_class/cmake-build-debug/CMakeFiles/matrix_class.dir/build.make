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
CMAKE_SOURCE_DIR = D:\Dekr0\cmput275\we\matrix_class

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Dekr0\cmput275\we\matrix_class\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/matrix_class.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/matrix_class.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/matrix_class.dir/flags.make

CMakeFiles/matrix_class.dir/test.cpp.obj: CMakeFiles/matrix_class.dir/flags.make
CMakeFiles/matrix_class.dir/test.cpp.obj: ../test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Dekr0\cmput275\we\matrix_class\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/matrix_class.dir/test.cpp.obj"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe"  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\matrix_class.dir\test.cpp.obj -c D:\Dekr0\cmput275\we\matrix_class\test.cpp

CMakeFiles/matrix_class.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/matrix_class.dir/test.cpp.i"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Dekr0\cmput275\we\matrix_class\test.cpp > CMakeFiles\matrix_class.dir\test.cpp.i

CMakeFiles/matrix_class.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/matrix_class.dir/test.cpp.s"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Dekr0\cmput275\we\matrix_class\test.cpp -o CMakeFiles\matrix_class.dir\test.cpp.s

CMakeFiles/matrix_class.dir/matrix.cpp.obj: CMakeFiles/matrix_class.dir/flags.make
CMakeFiles/matrix_class.dir/matrix.cpp.obj: ../matrix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Dekr0\cmput275\we\matrix_class\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/matrix_class.dir/matrix.cpp.obj"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe"  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\matrix_class.dir\matrix.cpp.obj -c D:\Dekr0\cmput275\we\matrix_class\matrix.cpp

CMakeFiles/matrix_class.dir/matrix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/matrix_class.dir/matrix.cpp.i"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Dekr0\cmput275\we\matrix_class\matrix.cpp > CMakeFiles\matrix_class.dir\matrix.cpp.i

CMakeFiles/matrix_class.dir/matrix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/matrix_class.dir/matrix.cpp.s"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Dekr0\cmput275\we\matrix_class\matrix.cpp -o CMakeFiles\matrix_class.dir\matrix.cpp.s

# Object files for target matrix_class
matrix_class_OBJECTS = \
"CMakeFiles/matrix_class.dir/test.cpp.obj" \
"CMakeFiles/matrix_class.dir/matrix.cpp.obj"

# External object files for target matrix_class
matrix_class_EXTERNAL_OBJECTS =

matrix_class.exe: CMakeFiles/matrix_class.dir/test.cpp.obj
matrix_class.exe: CMakeFiles/matrix_class.dir/matrix.cpp.obj
matrix_class.exe: CMakeFiles/matrix_class.dir/build.make
matrix_class.exe: CMakeFiles/matrix_class.dir/linklibs.rsp
matrix_class.exe: CMakeFiles/matrix_class.dir/objects1.rsp
matrix_class.exe: CMakeFiles/matrix_class.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Dekr0\cmput275\we\matrix_class\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable matrix_class.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\matrix_class.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/matrix_class.dir/build: matrix_class.exe

.PHONY : CMakeFiles/matrix_class.dir/build

CMakeFiles/matrix_class.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\matrix_class.dir\cmake_clean.cmake
.PHONY : CMakeFiles/matrix_class.dir/clean

CMakeFiles/matrix_class.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Dekr0\cmput275\we\matrix_class D:\Dekr0\cmput275\we\matrix_class D:\Dekr0\cmput275\we\matrix_class\cmake-build-debug D:\Dekr0\cmput275\we\matrix_class\cmake-build-debug D:\Dekr0\cmput275\we\matrix_class\cmake-build-debug\CMakeFiles\matrix_class.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/matrix_class.dir/depend

