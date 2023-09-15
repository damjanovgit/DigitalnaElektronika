cmake_minimum_required(VERSION 3.12)


project(Flip_Flop_Milica)

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
    COMMAND ghdl-gcc -e d_testbench
    COMMAND ghdl-gcc -e jk_testbench
    COMMAND ghdl-gcc -e rs_testbench
    COMMAND ghdl-gcc -e t_testbench
)

add_test(
    NAME ${PROJECT_NAME}_test_d_flipflop_Milica_Runjo
    COMMAND ./d_testbench
)
add_test(
    NAME ${PROJECT_NAME}_test_t_flipflop_Milica_Runjo
    COMMAND ./t_testbench
)
add_test(
    NAME ${PROJECT_NAME}_test_rs_flipflop_Milica_Runjo
    COMMAND ./rs_testbench
)
add_test(
    NAME ${PROJECT_NAME}_test_jk_flipflop_Milica_Runjo
    COMMAND ./jk_testbench
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)