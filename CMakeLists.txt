cmake_minimum_required(VERSION 3.0)
project(mygame C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

if (EMSCRIPTEN)
  set(PLATFORM "Web" CACHE BOOL "" FORCE)
endif ()

add_subdirectory(/raylib)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE ${PROJECT_SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT_INCLUDE})

if (EMSCRIPTEN)
  target_link_options(${PROJECT_NAME} PRIVATE -sUSE_GLFW=3 -sWASM=1 -sTOTAL_MEMORY=64MB)
  set(CMAKE_EXECUTABLE_SUFFIX ".html")
  target_link_options(${PROJECT_NAME} PRIVATE --preload-file ${CMAKE_CURRENT_SOURCE_DIR}/assets@/assets)
endif ()

target_link_libraries(${PROJECT_NAME} PRIVATE raylib)