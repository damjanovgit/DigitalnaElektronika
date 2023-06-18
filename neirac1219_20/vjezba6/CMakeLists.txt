cmake_minimum_required(VERSION 3.12)


project(lab6_Neira_1219)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/DekadniBrojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/DekadniBrojac_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Pomjeracki_Registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Pomjeracki_Registar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Stacionarni_Registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Stacionarni_Registar_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e DekadniBrojac_tb
    COMMAND ghdl-gcc -e Pomjeracki_Registar_tb
    COMMAND ghdl-gcc -e Stacionarni_Registar_tb
)

add_test(
    NAME DekadniBrojac_test_neira_cehic
    COMMAND ./DekadniBrojac_tb
)
add_test(
    NAME Pomjeracki_Registar_test_neira_cehic
    COMMAND ./Pomjeracki_Registar_tb
)
add_test(
    NAME Stacionarni_Registar_test_neira_cehic
    COMMAND ./Stacionarni_Registar_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
