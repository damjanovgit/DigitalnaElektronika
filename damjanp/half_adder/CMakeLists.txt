
cmake_minimum_required(VERSION 3.12)

project(half_adder)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/half_adder.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/half_adder_tb.vhdl
    )

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD 
    COMMAND ghdl
    ARGS -a --workdir=${CMAKE_BINARY_DIR} ${SOURCES}
    )

add_test(
    NAME ${PROJECT_NAME}_test
    COMMAND ghdl -r --workdir=${CMAKE_BINARY_DIR} half_adder_tb#Ovdje unijeti ime entiteta u testbenchu
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
