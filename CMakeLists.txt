cmake_minimum_required(VERSION 3.17)
project(gltest)

set(CMAKE_CXX_STANDARD 14)

if(WIN32)
    include_directories(${PROJECT_SOURCE_DIR}/include)

    link_directories(${PROJECT_SOURCE_DIR}/lib/windows)

    add_executable(gltest ${PROJECT_SOURCE_DIR}/src/main.cpp ${PROJECT_SOURCE_DIR}/src/glad.c
            ${PROJECT_SOURCE_DIR}/src/Shaders.cpp ${PROJECT_SOURCE_DIR}/src/Camera.cpp ${PROJECT_SOURCE_DIR}/src/Sphere.cpp)

    target_link_libraries(gltest glfw3)
endif()

if(APPLE)
    set(GLEW_H /usr/local/Cellar/glew/2.1.0_1/include)
    set(GLFW_H /usr/local/Cellar/glfw/3.3.2/include)
    set(GLAD_H /usr/local/include)
    set(KH_H /usr/local/include/KHR)
    include_directories(${GLEW_H} ${GLFW_H} ${GLAD_H} ${KH_H} ${PROJECT_SOURCE_DIR}/include)

# 添加目标链接
    set(GLEW_LINK /usr/local/Cellar/glew/2.1.0_1/lib/libGLEW.2.1.dylib)
    set(GLFW_LINK /usr/local/Cellar/glfw/3.3.2/lib/libglfw.3.dylib)
    link_libraries(${OPENGL} ${GLEW_LINK} ${GLFW_LINK})

# 执行编译命令
# 这个glad.c在第2步中说过要拉到项目中，注意路径
    set(SOURCE_FILES src/glad.c src/main.cpp src/Shaders.cpp src/Camera.cpp src/Sphere.cpp)

    add_executable(test ${SOURCE_FILES})

    target_link_libraries(test "-framework OpenGL")
    target_link_libraries(test "-framework GLUT")
endif()