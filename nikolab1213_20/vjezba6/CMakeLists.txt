cmake_minimum_required(VERSION 3.12)


project(registri)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/stacionarni_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/stacionarni_registar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/pomjeracki_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/pomjeracki_registar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/dekadni_brojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/dekadni_brojac_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e stacionarni_registar
    COMMAND ghdl-gcc -e pomjeracki_registar
    COMMAND ghdl-gcc -e dekadni_brojac
)

add_test(
    NAME stacionarni_registar_nikola_babic
    COMMAND ./stacionarni_registar
)
add_test(
    NAME pomjeracki_registar_nikola_babic
    COMMAND ./pomjeracki_registar
)
add_test(
    NAME dekadni_brojac_nikola_babic
    COMMAND ./dekadni_brojac
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)