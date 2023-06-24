cmake_minimum_required(VERSION 3.12)

project(Lab8)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/RAM_One_Port.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RAM_One_Port_TB.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e RAM_One_Port_TB
)

add_test(
    NAME RAM_One_Port_TB_test
    COMMAND ./ram_one_port_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)