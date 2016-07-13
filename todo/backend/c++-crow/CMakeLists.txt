cmake_minimum_required(VERSION 3.3)
project(crow-todo)

find_package( Boost 1.52 COMPONENTS date_time filesystem system thread REQUIRED )
include_directories(${Boost_INCLUDE_DIR})

add_subdirectory("crow")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -std=c++14")

set(SOURCE_FILES main.cpp backend/Todo.cpp backend/TodoList.cpp backend/CrowBack.cpp)
add_executable(crow-todo ${SOURCE_FILES} backend/Todo.h backend/TodoList.h backend/CrowBack.h)
target_link_libraries(crow-todo ${Boost_LIBRARIES} pthread)