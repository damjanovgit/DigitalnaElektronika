cmake_minimum_required(VERSION 3.12)


project(Ram_Milica)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/ram.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/ram_testbench.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e ram_testbench
)

add_test(
    NAME test_ram_Milica_Runjo
    COMMAND ./ram_testbench
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)