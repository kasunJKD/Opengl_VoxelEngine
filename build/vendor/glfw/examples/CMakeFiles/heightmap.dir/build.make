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
include vendor/glfw/examples/CMakeFiles/heightmap.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include vendor/glfw/examples/CMakeFiles/heightmap.dir/compiler_depend.make

# Include the progress variables for this target.
include vendor/glfw/examples/CMakeFiles/heightmap.dir/progress.make

# Include the compile flags for this target's objects.
include vendor/glfw/examples/CMakeFiles/heightmap.dir/flags.make

vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.o: vendor/glfw/examples/CMakeFiles/heightmap.dir/flags.make
vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.o: ../vendor/glfw/examples/heightmap.c
vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.o: vendor/glfw/examples/CMakeFiles/heightmap.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.o -MF CMakeFiles/heightmap.dir/heightmap.c.o.d -o CMakeFiles/heightmap.dir/heightmap.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/examples/heightmap.c

vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/heightmap.dir/heightmap.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/examples/heightmap.c > CMakeFiles/heightmap.dir/heightmap.c.i

vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/heightmap.dir/heightmap.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/examples/heightmap.c -o CMakeFiles/heightmap.dir/heightmap.c.s

vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o: vendor/glfw/examples/CMakeFiles/heightmap.dir/flags.make
vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o: ../vendor/glfw/deps/glad_gl.c
vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o: vendor/glfw/examples/CMakeFiles/heightmap.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o -MF CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o.d -o CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o -c /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c

vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/heightmap.dir/__/deps/glad_gl.c.i"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c > CMakeFiles/heightmap.dir/__/deps/glad_gl.c.i

vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/heightmap.dir/__/deps/glad_gl.c.s"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/p99kasun/Personal/voxelEngine/vendor/glfw/deps/glad_gl.c -o CMakeFiles/heightmap.dir/__/deps/glad_gl.c.s

# Object files for target heightmap
heightmap_OBJECTS = \
"CMakeFiles/heightmap.dir/heightmap.c.o" \
"CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o"

# External object files for target heightmap
heightmap_EXTERNAL_OBJECTS =

vendor/glfw/examples/heightmap: vendor/glfw/examples/CMakeFiles/heightmap.dir/heightmap.c.o
vendor/glfw/examples/heightmap: vendor/glfw/examples/CMakeFiles/heightmap.dir/__/deps/glad_gl.c.o
vendor/glfw/examples/heightmap: vendor/glfw/examples/CMakeFiles/heightmap.dir/build.make
vendor/glfw/examples/heightmap: vendor/glfw/src/libglfw3.a
vendor/glfw/examples/heightmap: /usr/lib/x86_64-linux-gnu/libm.so
vendor/glfw/examples/heightmap: /usr/lib/x86_64-linux-gnu/librt.a
vendor/glfw/examples/heightmap: /usr/lib/x86_64-linux-gnu/libm.so
vendor/glfw/examples/heightmap: /usr/lib/x86_64-linux-gnu/libX11.so
vendor/glfw/examples/heightmap: vendor/glfw/examples/CMakeFiles/heightmap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/p99kasun/Personal/voxelEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable heightmap"
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/heightmap.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vendor/glfw/examples/CMakeFiles/heightmap.dir/build: vendor/glfw/examples/heightmap
.PHONY : vendor/glfw/examples/CMakeFiles/heightmap.dir/build

vendor/glfw/examples/CMakeFiles/heightmap.dir/clean:
	cd /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples && $(CMAKE_COMMAND) -P CMakeFiles/heightmap.dir/cmake_clean.cmake
.PHONY : vendor/glfw/examples/CMakeFiles/heightmap.dir/clean

vendor/glfw/examples/CMakeFiles/heightmap.dir/depend:
	cd /home/p99kasun/Personal/voxelEngine/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/p99kasun/Personal/voxelEngine /home/p99kasun/Personal/voxelEngine/vendor/glfw/examples /home/p99kasun/Personal/voxelEngine/build /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples /home/p99kasun/Personal/voxelEngine/build/vendor/glfw/examples/CMakeFiles/heightmap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vendor/glfw/examples/CMakeFiles/heightmap.dir/depend

