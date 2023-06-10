cmake_minimum_required(VERSION 3.12)


project(FlipFlops)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/D_FlipFlop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/D_FlipFlop_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_FlipFlop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_FlipFlop_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_FlipFlop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_FlipFlop_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_FlipFlop.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_FlipFlop_TB.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e D_FlipFlop_TB
    COMMAND ghdl-gcc -e JK_FlipFlop_TB
    COMMAND ghdl-gcc -e RS_FlipFlop_TB
    COMMAND ghdl-gcc -e T_FlipFlop_TB
)

add_test(
    NAME D_FlipFlop_TB_test
    COMMAND ./D_FlipFlop_TB
)
add_test(
    NAME T_FlipFlop_TB_test
    COMMAND ./T_FlipFlop_TB
)
add_test(
    NAME RS_FlipFlop_TB_test
    COMMAND ./RS_FlipFlop_TB
)
add_test(
    NAME JK_FlipFlop_TB_test
    COMMAND ./JK_FlipFlop_TB
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)