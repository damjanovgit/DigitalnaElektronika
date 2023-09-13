cmake_minimum_required(VERSION 3.12)


project(flipflop)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/d_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/d_flipflop_testbench.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/t_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/t_flipflop_testbench.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/rs_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/rs_flipflop_testbench.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/jk_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/jk_flipflop_testbench.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e d_flipflop_testbench
    COMMAND ghdl-gcc -e jk_flipflop_testbench
    COMMAND ghdl-gcc -e rs_flipflop_testbench
    COMMAND ghdl-gcc -e t_flipflop_testbench
)

add_test(
    NAME d_flipflop_testbench_test
    COMMAND ./d_flipflop_testbench
)
add_test(
    NAME t_flipflop_testbench_test
    COMMAND ./t_flipflop_testbench
)
add_test(
    NAME RS_flipflop_tb_test
    COMMAND ./rs_flipflop_testbench
)
add_test(
    NAME JK_flipflop_tb_test
    COMMAND ./jk_flipflop_testbench
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)