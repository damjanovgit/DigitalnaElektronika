cmake_minimum_required(VERSION 3.12)

project(Lab6)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/Register10bit.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Register10bit_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Shift_Register.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Shift_Register_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Decimal_Counter.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Decimal_Counter_TB.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e Register10bit_TB
    COMMAND ghdl-gcc -e Shift_Register_TB
    COMMAND ghdl-gcc -e Decimal_Counter_TB
)

add_test(
    NAME Register10bit_TB_test
    COMMAND ./Register10bit_TB
)
add_test(
    NAME Shift_Register_TB_test
    COMMAND ./Shift_Register_TB
)
add_test(
    NAME Decimal_Counter_TB_test
    COMMAND ./Decimal_Counter_TB
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)