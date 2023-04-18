cmake_minimum_required(VERSION 3.12)


project(FF)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/D_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/D_FF_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_FF_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_FF_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_FF_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e D_FF_tb
    COMMAND ghdl-gcc -e JK_FF_tb
    COMMAND ghdl-gcc -e RS_FF_tb
    COMMAND ghdl-gcc -e T_FF_tb
)

add_test(
    NAME D_FF_tb_test_stefanb1221_18
    COMMAND ./D_FF_tb.vhdl
)
add_test(
    NAME T_FF_tb_test_stefanb1221_18
    COMMAND ./T_FF_tb.vhdl
)
add_test(
    NAME RS_FF_tb_test_stefanb1221_18
    COMMAND ./RS_FF_tb.vhdl
)
add_test(
    NAME JK_FF_tb_test_stefanb1221_18
    COMMAND ./JK_FF_tb.vhdl
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)