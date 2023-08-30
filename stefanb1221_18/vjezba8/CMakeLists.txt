cmake_minimum_required(VERSION 3.12)


project(vjezba8)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/one_port_ram.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/one_port_ram_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e one_port_ram_tb
)

add_test(
    NAME test_ram_stefan_bijak
    COMMAND ./one_port_ram_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)