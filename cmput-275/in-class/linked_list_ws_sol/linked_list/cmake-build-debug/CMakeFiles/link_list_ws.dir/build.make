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
CMAKE_SOURCE_DIR = D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/link_list_ws.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/link_list_ws.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/link_list_ws.dir/flags.make

CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.obj: CMakeFiles/link_list_ws.dir/flags.make
CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.obj: ../listtest_ws_sol.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.obj"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe"  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\link_list_ws.dir\listtest_ws_sol.cpp.obj -c D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\listtest_ws_sol.cpp

CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.i"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\listtest_ws_sol.cpp > CMakeFiles\link_list_ws.dir\listtest_ws_sol.cpp.i

CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.s"
	"D:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\listtest_ws_sol.cpp -o CMakeFiles\link_list_ws.dir\listtest_ws_sol.cpp.s

# Object files for target link_list_ws
link_list_ws_OBJECTS = \
"CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.obj"

# External object files for target link_list_ws
link_list_ws_EXTERNAL_OBJECTS =

link_list_ws.exe: CMakeFiles/link_list_ws.dir/listtest_ws_sol.cpp.obj
link_list_ws.exe: CMakeFiles/link_list_ws.dir/build.make
link_list_ws.exe: CMakeFiles/link_list_ws.dir/linklibs.rsp
link_list_ws.exe: CMakeFiles/link_list_ws.dir/objects1.rsp
link_list_ws.exe: CMakeFiles/link_list_ws.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable link_list_ws.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\link_list_ws.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/link_list_ws.dir/build: link_list_ws.exe

.PHONY : CMakeFiles/link_list_ws.dir/build

CMakeFiles/link_list_ws.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\link_list_ws.dir\cmake_clean.cmake
.PHONY : CMakeFiles/link_list_ws.dir/clean

CMakeFiles/link_list_ws.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\cmake-build-debug D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\cmake-build-debug D:\Dekr0\cmput275\in-class\linked_list_ws_sol\linked_list\cmake-build-debug\CMakeFiles\link_list_ws.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/link_list_ws.dir/depend

