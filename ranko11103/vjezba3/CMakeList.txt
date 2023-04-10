cmake_minimum_required(VERSION 3.12)


project(flipflop_vjezba_3)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/d_ff.VHDL
    ${CMAKE_CURRENT_SOURCE_DIR}/d_ff_testbench.VHDL
    ${CMAKE_CURRENT_SOURCE_DIR}/t_ff.VHDL
    ${CMAKE_CURRENT_SOURCE_DIR}/t_ff_testbench.VHDL
    ${CMAKE_CURRENT_SOURCE_DIR}/rs_latch.VHDL
    ${CMAKE_CURRENT_SOURCE_DIR}/rs_testbench.VHDL
    ${CMAKE_CURRENT_SOURCE_DIR}/jk_ff.VHDL
    ${CMAKE_CURRENT_SOURCE_DIR}/jk_ff_testbench.VHDL
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e d_ff_testbench
    COMMAND ghdl-gcc -e jk_ff_testbench
    COMMAND ghdl-gcc -e rs_testbench
    COMMAND ghdl-gcc -e t_ff_testbench
)

add_test(
    NAME D_flipflop_tb_test_ranko
    COMMAND ./d_flipflop_tb
)
add_test(
    NAME T_flipflop_tb_test_ranko
    COMMAND ./t_flipflop_tb
)
add_test(
    NAME RS_flipflop_tb_test_ranko
    COMMAND ./rs_flipflop_tb
)
add_test(
    NAME JK_flipflop_tb_test_ranko
    COMMAND ./jk_flipflop_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
