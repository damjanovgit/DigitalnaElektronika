
cmake_minimum_required(VERSION 3.12)


project(lab06)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/dekadni_brojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_dekadni_brojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/pom_reg_6.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_pom_reg_6.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/stac_reg_10.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_stac_reg_10.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e tb_dekadni_brojac
    COMMAND ghdl-gcc -e tb_pom_reg_6
    COMMAND ghdl-gcc -e tb_stac_reg_10
)

add_test(
    NAME dekadni_brojac_test_anja_djakovic
    COMMAND ./tb_dekadni_brojac
)
add_test(
    NAME pom_reg_6_test_anja_djakovic
    COMMAND ./tb_pom_reg_6
)
add_test(
    NAME stac_reg_10_test_anja_djakovic
    COMMAND ./tb_stac_reg_10
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
