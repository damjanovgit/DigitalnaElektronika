cmake_minimum_required(VERSION 3.12)


project(V6)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/6_bitni_pomjeracki_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/6_bitni_pomjeracki_registar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/10_bitni_stacionarni_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/10_bitni_stacionarni_registar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/dekadni_brojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/dekadni_brojac_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e shift_register_tb
    COMMAND ghdl-gcc -e bcd_counter_tb
    COMMAND ghdl-gcc -e stac_register_tb
)

add_test(
    NAME dekadni_brojac_test_stefan_bijak
    COMMAND ./dekadni_brojac_tb
)
add_test(
    NAME pomjeracki_registar_test_stefan_bijak
    COMMAND ./6_bitni_pomjeracki_registar_tb
)
add_test(
    NAME stac_registar_test_stefan_bijak
    COMMAND ./10_bitni_stacionarni_registar_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)