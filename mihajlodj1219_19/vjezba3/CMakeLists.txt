cmake_minimum_required(VERSION 3.12)


project(flipflops)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/D_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/D_flipflop_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_flipflop_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_flipflop_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_flipflop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_flipflop_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e D_flipflop_tb
    COMMAND ghdl-gcc -e JK_flipflop_tb
    COMMAND ghdl-gcc -e RS_flipflop_tb
    COMMAND ghdl-gcc -e T_flipflop_tb
)

add_test(
    NAME D_flipflop_tb_test
    COMMAND ./d_flipflop_tb
)
add_test(
    NAME T_flipflop_tb_test
    COMMAND ./t_flipflop_tb
)
add_test(
    NAME RS_flipflop_tb_test
    COMMAND ./rs_flipflop_tb
)
add_test(
    NAME JK_flipflop_tb_test
    COMMAND ./jk_flipflop_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)