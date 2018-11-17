cmake_minimum_required(VERSION 3.12)
project(rock)

# project versioning..
set(majorVersion 0)
set(minorVersion 10)

configure_file (
	"${PROJECT_SOURCE_DIR}/rockConfig.h.in"
	"${PROJECT_BINARY_DIR}/rockConfig.h"
)

include_directories("${PROJECT_BINARY_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/libs/argh")

add_executable(rock src/main.cpp)
