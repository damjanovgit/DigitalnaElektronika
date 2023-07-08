
cmake_minimum_required(VERSION 3.12)


project(flip_flopovi)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/d_flipflop.vhdl.txt
    ${CMAKE_CURRENT_SOURCE_DIR}/d_flipflop_tb.vhdl.txt
    ${CMAKE_CURRENT_SOURCE_DIR}/jk_FlipFlop.vhdl.txt
    ${CMAKE_CURRENT_SOURCE_DIR}/jk_flipflop_tb.vhdl.txt
    ${CMAKE_CURRENT_SOURCE_DIR}/rs_FlipFlop.vhdl.txt
    ${CMAKE_CURRENT_SOURCE_DIR}/rs_flipflop_tb.vhdl.txt
    ${CMAKE_CURRENT_SOURCE_DIR}/t_flipflop.vhdl.txt
    ${CMAKE_CURRENT_SOURCE_DIR}/t_flipflop_tb.vhdl.txt
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e d_flipflop_tb
    COMMAND ghdl-gcc -e jk_flipflop_tb
    COMMAND ghdl-gcc -e rs_flipflop_tb
    COMMAND ghdl-gcc -e t_flipflop_tb
)

add_test(
    NAME d_ff_test
    COMMAND ./d_flipflop_tb
)
add_test(
    NAME t_ff_test
    COMMAND ./t_flipflop_tb
)
add_test(
    NAME rs_ff_test
    COMMAND ./rs_flipflop_tb
)
add_test(
    NAME jk_ff_test
    COMMAND ./jk_flipflop_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
