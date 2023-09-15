cmake_minimum_required(VERSION 3.12)


project(Registri_Brojaci_Milica)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/DekadniBrojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_DekadniBrojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/Pomjeracki_Registar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/TestBenchPReg.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/stacionarni_reg.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_stacionarni_reg.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e tb
    COMMAND ghdl-gcc -e TestBenchPReg
    COMMAND ghdl-gcc -e tb_stacionarni_reg
)

add_test(
    NAME test_DekadniBrojac_Milica_Runjo
    COMMAND ./tb
)
add_test(
    NAME test_Pomjeracki_Registar_Milica_Runjo
    COMMAND ./testbenchpreg
)
add_test(
    NAME test_Stacionarni_Registar_Milica_Runjo
    COMMAND ./tb_stacionarni_reg
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)