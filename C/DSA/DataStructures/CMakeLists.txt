cmake_minimum_required(VERSION 2.8)
project(AMH_LinkedList)

add_library(LinkedList LinkedList.c)

add_executable(test LinkedList test.c)
