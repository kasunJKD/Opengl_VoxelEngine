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
include vendor/glfw/tests/CMakeFiles/threads.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include vendor/glfw/tests/CMakeFiles/threads.dir/compiler_depend.make

# Include the progress variables for this target.
include vendor/glfw/tests/CMakeFiles/threads.dir/progress.make

# Include the compile flags for this target's objects.
include vendor/glfw/tests/CMakeFiles/threads.dir/flags.make

vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.o: vendor/glfw/tests/CMakeFiles/threads.dir/flags.make
vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.o: ../vendor/glfw/tests/threads.c
vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.o: vendor/glfw/tests/CMakeFiles/threads.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.o -MF CMakeFiles/threads.dir/threads.c.o.d -o CMakeFiles/threads.dir/threads.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests/threads.c

vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threads.dir/threads.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests/threads.c > CMakeFiles/threads.dir/threads.c.i

vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threads.dir/threads.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests/threads.c -o CMakeFiles/threads.dir/threads.c.s

vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o: vendor/glfw/tests/CMakeFiles/threads.dir/flags.make
vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o: ../vendor/glfw/deps/tinycthread.c
vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o: vendor/glfw/tests/CMakeFiles/threads.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o -MF CMakeFiles/threads.dir/__/deps/tinycthread.c.o.d -o CMakeFiles/threads.dir/__/deps/tinycthread.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/tinycthread.c

vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threads.dir/__/deps/tinycthread.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/tinycthread.c > CMakeFiles/threads.dir/__/deps/tinycthread.c.i

vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threads.dir/__/deps/tinycthread.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/tinycthread.c -o CMakeFiles/threads.dir/__/deps/tinycthread.c.s

vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o: vendor/glfw/tests/CMakeFiles/threads.dir/flags.make
vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o: ../vendor/glfw/deps/glad_gl.c
vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o: vendor/glfw/tests/CMakeFiles/threads.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o -MF CMakeFiles/threads.dir/__/deps/glad_gl.c.o.d -o CMakeFiles/threads.dir/__/deps/glad_gl.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c

vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threads.dir/__/deps/glad_gl.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c > CMakeFiles/threads.dir/__/deps/glad_gl.c.i

vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threads.dir/__/deps/glad_gl.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c -o CMakeFiles/threads.dir/__/deps/glad_gl.c.s

# Object files for target threads
threads_OBJECTS = \
"CMakeFiles/threads.dir/threads.c.o" \
"CMakeFiles/threads.dir/__/deps/tinycthread.c.o" \
"CMakeFiles/threads.dir/__/deps/glad_gl.c.o"

# External object files for target threads
threads_EXTERNAL_OBJECTS =

vendor/glfw/tests/threads: vendor/glfw/tests/CMakeFiles/threads.dir/threads.c.o
vendor/glfw/tests/threads: vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o
vendor/glfw/tests/threads: vendor/glfw/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o
vendor/glfw/tests/threads: vendor/glfw/tests/CMakeFiles/threads.dir/build.make
vendor/glfw/tests/threads: vendor/glfw/src/libglfw3.a
vendor/glfw/tests/threads: /usr/lib/x86_64-linux-gnu/libm.so
vendor/glfw/tests/threads: /usr/lib/x86_64-linux-gnu/librt.a
vendor/glfw/tests/threads: /usr/lib/x86_64-linux-gnu/libX11.so
vendor/glfw/tests/threads: vendor/glfw/tests/CMakeFiles/threads.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable threads"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/threads.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vendor/glfw/tests/CMakeFiles/threads.dir/build: vendor/glfw/tests/threads
.PHONY : vendor/glfw/tests/CMakeFiles/threads.dir/build

vendor/glfw/tests/CMakeFiles/threads.dir/clean:
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests && $(CMAKE_COMMAND) -P CMakeFiles/threads.dir/cmake_clean.cmake
.PHONY : vendor/glfw/tests/CMakeFiles/threads.dir/clean

vendor/glfw/tests/CMakeFiles/threads.dir/depend:
	cd /home/p99kasun/Personal/voxelEngine/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/p99kasun/Personal/voxelEngine /home/p99kasun/Personal/voxelEngine/vendor/glfw/tests /home/p99kasun/Personal/voxelEngine/build /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/tests/CMakeFiles/threads.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vendor/glfw/tests/CMakeFiles/threads.dir/depend

