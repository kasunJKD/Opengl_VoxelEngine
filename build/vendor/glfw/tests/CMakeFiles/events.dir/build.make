# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/p99kasun/Personal/voxelEngine

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/p99kasun/Personal/voxelEngine/build

# Include any dependencies generated for this target.
include vendor/glfw/tests/CMakeFiles/events.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include vendor/glfw/tests/CMakeFiles/events.dir/compiler_depend.make

# Include the progress variables for this target.
include vendor/glfw/tests/CMakeFiles/events.dir/progress.make

# Include the compile flags for this target's objects.
include vendor/glfw/tests/CMakeFiles/events.dir/flags.make

vendor/glfw/tests/CMakeFiles/events.dir/events.c.o: vendor/glfw/tests/CMakeFiles/events.dir/flags.make
vendor/glfw/tests/CMakeFiles/events.dir/events.c.o: ../vendor/glfw/tests/events.c
vendor/glfw/tests/CMakeFiles/events.dir/events.c.o: vendor/glfw/tests/CMakeFiles/events.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object vendor/glfw/tests/CMakeFiles/events.dir/events.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/tests/CMakeFiles/events.dir/events.c.o -MF CMakeFiles/events.dir/events.c.o.d -o CMakeFiles/events.dir/events.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests/events.c

vendor/glfw/tests/CMakeFiles/events.dir/events.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/events.dir/events.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests/events.c > CMakeFiles/events.dir/events.c.i

vendor/glfw/tests/CMakeFiles/events.dir/events.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/events.dir/events.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests/events.c -o CMakeFiles/events.dir/events.c.s

vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.o: vendor/glfw/tests/CMakeFiles/events.dir/flags.make
vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.o: ../vendor/glfw/deps/getopt.c
vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.o: vendor/glfw/tests/CMakeFiles/events.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.o -MF CMakeFiles/events.dir/__/deps/getopt.c.o.d -o CMakeFiles/events.dir/__/deps/getopt.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/getopt.c

vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/events.dir/__/deps/getopt.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/getopt.c > CMakeFiles/events.dir/__/deps/getopt.c.i

vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/events.dir/__/deps/getopt.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/getopt.c -o CMakeFiles/events.dir/__/deps/getopt.c.s

vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.o: vendor/glfw/tests/CMakeFiles/events.dir/flags.make
vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.o: ../vendor/glfw/deps/glad_gl.c
vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.o: vendor/glfw/tests/CMakeFiles/events.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.o -MF CMakeFiles/events.dir/__/deps/glad_gl.c.o.d -o CMakeFiles/events.dir/__/deps/glad_gl.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c

vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/events.dir/__/deps/glad_gl.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c > CMakeFiles/events.dir/__/deps/glad_gl.c.i

vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/events.dir/__/deps/glad_gl.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c -o CMakeFiles/events.dir/__/deps/glad_gl.c.s

# Object files for target events
events_OBJECTS = \
"CMakeFiles/events.dir/events.c.o" \
"CMakeFiles/events.dir/__/deps/getopt.c.o" \
"CMakeFiles/events.dir/__/deps/glad_gl.c.o"

# External object files for target events
events_EXTERNAL_OBJECTS =

vendor/glfw/tests/events: vendor/glfw/tests/CMakeFiles/events.dir/events.c.o
vendor/glfw/tests/events: vendor/glfw/tests/CMakeFiles/events.dir/__/deps/getopt.c.o
vendor/glfw/tests/events: vendor/glfw/tests/CMakeFiles/events.dir/__/deps/glad_gl.c.o
vendor/glfw/tests/events: vendor/glfw/tests/CMakeFiles/events.dir/build.make
vendor/glfw/tests/events: vendor/glfw/src/libglfw3.a
vendor/glfw/tests/events: /usr/lib/x86_64-linux-gnu/libm.so
vendor/glfw/tests/events: /usr/lib/x86_64-linux-gnu/librt.a
vendor/glfw/tests/events: /usr/lib/x86_64-linux-gnu/libm.so
vendor/glfw/tests/events: /usr/lib/x86_64-linux-gnu/libX11.so
vendor/glfw/tests/events: vendor/glfw/tests/CMakeFiles/events.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable events"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/events.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vendor/glfw/tests/CMakeFiles/events.dir/build: vendor/glfw/tests/events
.PHONY : vendor/glfw/tests/CMakeFiles/events.dir/build

vendor/glfw/tests/CMakeFiles/events.dir/clean:
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && $(CMAKE_COMMAND) -P CMakeFiles/events.dir/cmake_clean.cmake
.PHONY : vendor/glfw/tests/CMakeFiles/events.dir/clean

vendor/glfw/tests/CMakeFiles/events.dir/depend:
	cd /home/p99kasun/Personal/voxelEngine/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/p99kasun/Personal/voxelEngine /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests /home/p99kasun/Personal/voxelEngine/build /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests/CMakeFiles/events.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vendor/glfw/tests/CMakeFiles/events.dir/depend

