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
CMAKE_SOURCE_DIR = D:\Dekr0\cmput275\in-class\lec09-code\linked_list

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Dekr0\cmput275\in-class\lec09-code\linked_list\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Linked_List.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Linked_List.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Linked_List.dir/flags.make

CMakeFiles/Linked_List.dir/listtest.cpp.obj: CMakeFiles/Linked_List.dir/flags.make
CMakeFiles/Linked_List.dir/listtest.cpp.obj: ../listtest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Dekr0\cmput275\in-class\lec09-code\linked_list\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Linked_List.dir/listtest.cpp.obj"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe"  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\Linked_List.dir\listtest.cpp.obj -c D:\Dekr0\cmput275\in-class\lec09-code\linked_list\listtest.cpp

CMakeFiles/Linked_List.dir/listtest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Linked_List.dir/listtest.cpp.i"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Dekr0\cmput275\in-class\lec09-code\linked_list\listtest.cpp > CMakeFiles\Linked_List.dir\listtest.cpp.i

CMakeFiles/Linked_List.dir/listtest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Linked_List.dir/listtest.cpp.s"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Dekr0\cmput275\in-class\lec09-code\linked_list\listtest.cpp -o CMakeFiles\Linked_List.dir\listtest.cpp.s

CMakeFiles/Linked_List.dir/test.cpp.obj: CMakeFiles/Linked_List.dir/flags.make
CMakeFiles/Linked_List.dir/test.cpp.obj: ../test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Dekr0\cmput275\in-class\lec09-code\linked_list\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Linked_List.dir/test.cpp.obj"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe"  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\Linked_List.dir\test.cpp.obj -c D:\Dekr0\cmput275\in-class\lec09-code\linked_list\test.cpp

CMakeFiles/Linked_List.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Linked_List.dir/test.cpp.i"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Dekr0\cmput275\in-class\lec09-code\linked_list\test.cpp > CMakeFiles\Linked_List.dir\test.cpp.i

CMakeFiles/Linked_List.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Linked_List.dir/test.cpp.s"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Dekr0\cmput275\in-class\lec09-code\linked_list\test.cpp -o CMakeFiles\Linked_List.dir\test.cpp.s

# Object files for target Linked_List
Linked_List_OBJECTS = \
"CMakeFiles/Linked_List.dir/listtest.cpp.obj" \
"CMakeFiles/Linked_List.dir/test.cpp.obj"

# External object files for target Linked_List
Linked_List_EXTERNAL_OBJECTS =

Linked_List.exe: CMakeFiles/Linked_List.dir/listtest.cpp.obj
Linked_List.exe: CMakeFiles/Linked_List.dir/test.cpp.obj
Linked_List.exe: CMakeFiles/Linked_List.dir/build.make
Linked_List.exe: CMakeFiles/Linked_List.dir/linklibs.rsp
Linked_List.exe: CMakeFiles/Linked_List.dir/objects1.rsp
Linked_List.exe: CMakeFiles/Linked_List.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Dekr0\cmput275\in-class\lec09-code\linked_list\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable Linked_List.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\Linked_List.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Linked_List.dir/build: Linked_List.exe

.PHONY : CMakeFiles/Linked_List.dir/build

CMakeFiles/Linked_List.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\Linked_List.dir\cmake_clean.cmake
.PHONY : CMakeFiles/Linked_List.dir/clean

CMakeFiles/Linked_List.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Dekr0\cmput275\in-class\lec09-code\linked_list D:\Dekr0\cmput275\in-class\lec09-code\linked_list D:\Dekr0\cmput275\in-class\lec09-code\linked_list\cmake-build-debug D:\Dekr0\cmput275\in-class\lec09-code\linked_list\cmake-build-debug D:\Dekr0\cmput275\in-class\lec09-code\linked_list\cmake-build-debug\CMakeFiles\Linked_List.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Linked_List.dir/depend
