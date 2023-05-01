# Specify a version of CMake installation needed to run this:
cmake_minimum_required(VERSION 3.8)

# Specify project name, version and languages (compilers) used:
project(GL_PROJECT
  LANGUAGES C CXX
)

# Create an executable with all the sources (.cpp or .c files) specified:
add_executable(gl_project
  "src/main.cpp"
  "src/glad.c"
  "src/GLShader.cpp"
)

# Specify include directories for our executable:
target_include_directories(gl_project 
  PUBLIC
  "include/"
  "vendor/glfw/include/"
  "vendor/glad/include/"
)

# ADDED:

# Link GLFW:
target_link_libraries(gl_project PUBLIC
  "${CMAKE_SOURCE_DIR}/vendor/glfw/lib-vc2022/glfw3.lib"
  opengl32.lib
)
