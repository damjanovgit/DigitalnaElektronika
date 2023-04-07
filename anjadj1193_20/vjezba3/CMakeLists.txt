
cmake_minimum_required(VERSION 3.12)


project(flipflops)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/d_ff.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/t_ff.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/rs_ff.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/jk_ff.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_d_ff.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_t_ff.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_rs_ff.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_jk_ff.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e tb_d_ff
    COMMAND ghdl-gcc -e tb_t_ff
    COMMAND ghdl-gcc -e tb_rs_ff
    COMMAND ghdl-gcc -e tb_jk_ff
)

add_test(
    NAME ${PROJECT_NAME}_test
    COMMAND ./tb_d_ff
)
add_test(
    NAME ${PROJECT_NAME}_test
    COMMAND ./tb_t_ff
)
add_test(
    NAME ${PROJECT_NAME}_test
    COMMAND ./tb_rs_ff
)
add_test(
    NAME ${PROJECT_NAME}_test
    COMMAND ./tb_jk_ff
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)