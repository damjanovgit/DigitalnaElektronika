cmake_minimum_required(VERSION 3.12)


project(vjezba6_registri_brojaci)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/Dekadni_brojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Dekadni_brojac_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Pomjeracki_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Pomjeracki_registar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Stac_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Stac_registar_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e Dekadni_brojac_tb
    COMMAND ghdl-gcc -e Pomjeracki_registar_tb
    COMMAND ghdl-gcc -e Stac_registar_tb
)

add_test(
    NAME dekadni_brojac_test_mihajlo_djukic
    COMMAND ./dekadni_brojac_tb
)
add_test(
    NAME pomjeracki_registar_test_mihajlo_djukic
    COMMAND ./pomjeracki_registar_tb
)
add_test(
    NAME stac_registar_test_mihajlo_djukic
    COMMAND ./stac_registar_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)