cmake_minimum_required(VERSION 3.12)


project(flipflopovi)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/DFF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/DFF_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/TFF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/TFF_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RSFF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RSFF_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JKFF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JKFF_TB.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e DFF_TB
    COMMAND ghdl-gcc -e TFF_TB
    COMMAND ghdl-gcc -e RSFF_TB
    COMMAND ghdl-gcc -e JKFF_TB
)

add_test(
    NAME DFF_TB_test_Neira_Cehic
    COMMAND ./dff_tb
)
add_test(
    NAME TFF_TB_test_Neira_Cehic
    COMMAND ./tff_tb
)
add_test(
    NAME RSFF_TB_test_Neira_Cehic
    COMMAND ./rsff_tb
)
add_test(
    NAME JKFF_TB_test_Neira_Cehic
    COMMAND ./jkff_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)