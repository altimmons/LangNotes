cmake_minimum_required(VERSION 3.17)
project(CPPProj)

set(CMAKE_CXX_STANDARD 20)

add_executable(CPPProj main.cpp Card.cpp Card.h cmake-build-debug/suit.cpp cmake-build-debug/suit.h main.h Value.cpp Value.h Suit.cpp Suit.h)