
cmake_minimum_required(VERSION 3.12)


project(flipflopovi)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_flip_flop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_flip_flop_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_flip_flop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_flip_flop_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/D_flip_flop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/D_flip_flop_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_flip_flop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_flip_flop_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e RS_flip_flop
    COMMAND ghdl-gcc -e JK_flip_flop
    COMMAND ghdl-gcc -e D_flip_flop
    COMMAND ghdl-gcc -e T_flip_flop
)

add_test(
    NAME rs_nikola_babic
    COMMAND ./rs_flip_flop
)
add_test(
    NAME jk_nikola_babic
    COMMAND ./jk_flip_flop
)
add_test(
    NAME d_nikola_babic
    COMMAND ./d_flip_flop
)
add_test(
    NAME t_nikola_babic
    COMMAND ./t_flip_flop
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)