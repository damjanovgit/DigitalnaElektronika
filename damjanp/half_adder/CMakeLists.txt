
cmake_minimum_required(VERSION 3.12)

project(half_adder)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/half_adder.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/half_adder_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e half_adder_tb
)

add_test(
    NAME ${PROJECT_NAME}_test
    COMMAND ./half_adder_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)