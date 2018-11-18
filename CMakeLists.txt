cmake_minimum_required(VERSION 3.12)
project(rock)

# project versioning..
set(majorVersion 0)
set(minorVersion 10)

#enable C++ 11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

configure_file (
	"${PROJECT_SOURCE_DIR}/rockConfig.h.in"
	"${PROJECT_BINARY_DIR}/rockConfig.h"
)

#copy grammar file to binary-dir before generate
file(COPY ${PROJECT_SOURCE_DIR}/grammar/lexer.y DESTINATION ${PROJECT_BINARY_DIR})
file(COPY ${PROJECT_SOURCE_DIR}/grammar/tokenizer.l DESTINATION ${PROJECT_BINARY_DIR})
#generate rock-lang tokenizer and lexer
execute_process(COMMAND bison -d lexer.y WORKING_DIRECTORY ${PROJECT_BINARY_DIR})
execute_process(COMMAND flex tokenizer.l WORKING_DIRECTORY ${PROJECT_BINARY_DIR})

#add_custom_command(
#	OUTPUT calc.tab.h calc.tab.c
#	COMMAND bison -d ${PROJECT_SOURCE_DIR/grammar}/calc.y
#	WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
#	DEPENDS ${PROJECT_SOURCE_DIR}/grammar/cacl.y
#)

include_directories("${PROJECT_BINARY_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/libs/argh")

add_executable(rock src/main.cpp)
