
cmake_minimum_required(VERSION 3.12)


project(lab6_sekvencijalni_moduli)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/bcd_counter.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/bcd_counter_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/shift_register.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/shift_register_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/ten_bit_register.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/ten_bit_register_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e bcd_counter_tb
    COMMAND ghdl-gcc -e shift_register_tb
    COMMAND ghdl-gcc -e ten_bit_register_tb
)

add_test(
    NAME bcd_counter_test_luka_vidic
    COMMAND ./bcd_counter_tb
)
add_test(
    NAME shift_register_test_luka_vidic
    COMMAND ./shift_register_tb
)
add_test(
    NAME ten_bit_register_test_luka_vidic
    COMMAND ./ten_bit_register_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
