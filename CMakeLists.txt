cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME OpenGL)
set(PROJECT_VERSION 0.0.1)

set(OpenGL_GL_PREFERENCE GLVND)

set(CURRENT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(SOURCE_PATH ${CURRENT_PATH}/src)
set(VENDOR_PATH ${CURRENT_PATH}/vendor)
set(VENDOR_glad_lib ${CURRENT_PATH}/vendor/glad/)

file( COPY ${SOURCE_PATH}/shaders DESTINATION ${CMAKE_CURRENT_BINARY_DIR} )

set(CMAKE_CXX_STANDARD 17)

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION} LANGUAGES CXX)

add_executable(${PROJECT_NAME} ${SOURCE_PATH}/main.cpp ${SOURCE_PATH}/GLSLShader.cpp ${SOURCE_PATH}/GLSLShader.h ${SOURCE_PATH}/AbstractCamera.h ${SOURCE_PATH}/AbstractCamera.cpp ${SOURCE_PATH}/FreeCamera.h ${SOURCE_PATH}/FreeCamera.cpp ${SOURCE_PATH}/TexturedPlane.h ${SOURCE_PATH}/TexturedPlane.cpp ${SOURCE_PATH}/RenderableObject.h ${SOURCE_PATH}/RenderableObject.cpp)

if (UNIX)
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra)
endif (UNIX)

# glfw
# lib requirements for linux: xorg-dev libglu1-mesa-dev
add_subdirectory(${VENDOR_PATH}/glfw)
target_link_libraries(${PROJECT_NAME} glfw)
find_package(OpenGL REQUIRED)
target_include_directories(${PROJECT_NAME} PRIVATE ${OPENGL_INCLUDE_DIR})

# glad
add_subdirectory(${VENDOR_PATH}/glad)
target_link_libraries(${PROJECT_NAME} glad)
target_include_directories(${PROJECT_NAME} PRIVATE ${OPENGL_INCLUDE_DIR})     

# glm
set(GLM_TEST_ENABLE CACHE BOOL OFF)
add_subdirectory(${VENDOR_PATH}/glm/glm)
target_link_libraries(${PROJECT_NAME} glm)