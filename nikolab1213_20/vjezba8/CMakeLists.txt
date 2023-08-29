cmake_minimum_required(VERSION 3.12)


project(ram_memorija)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/ram.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/ram_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e ram
)

add_test(
    NAME ram_nikola_babic
    COMMAND ./ram
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)