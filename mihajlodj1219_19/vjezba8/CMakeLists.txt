cmake_minimum_required(VERSION 3.12)


project(vjezba8_ram)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/One_Port_RAM.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/One_Port_RAM_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e One_Port_RAM_tb
)

add_test(
    NAME test_ram_mihajlo_djukic
    COMMAND ./one_port_ram_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)