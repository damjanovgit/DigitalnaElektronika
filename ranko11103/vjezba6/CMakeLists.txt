
cmake_minimum_required(VERSION 3.12)


project(vjezba6_registri_i_brojaci)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/d_brojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/d_brojac_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/p_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/p_registar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/s_registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/s_registar_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e d_brojac_tb
    COMMAND ghdl-gcc -e p_registar_tb
    COMMAND ghdl-gcc -e s_registar_tb
)

add_test(
    NAME d_brojac_test_ranko_mirosav
    COMMAND ./d_brojac_tb
)
add_test(
    NAME p_registar_test_ranko_mirosav
    COMMAND ./p_registar_tb
)
add_test(
    NAME s_registar_test_ranko_mirosav
    COMMAND ./s_registar_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
