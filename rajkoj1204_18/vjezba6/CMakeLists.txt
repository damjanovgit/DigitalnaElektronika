
cmake_minimum_required(VERSION 3.12)


project(registri i brojaci)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/dekadniBrojac.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/dekadniBrojac_Tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/pomjerackiRegistar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/pomjerackiRegistar_tb.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/stacionarniRegistar.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/stacionarniRegistar_Tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e DekadniBrojac_TB
    COMMAND ghdl-gcc -e PomjerackiRegistar_TB
    COMMAND ghdl-gcc -e stacionarniRegistar_tb
)

add_test(
    NAME dekadniBrojac
    COMMAND ./DekadniBrojac_TB
)
add_test(
    NAME pomjerackiRegistar
    COMMAND ./PomjerackiRegistar_TB
)
add_test(
    NAME stacionarniRegistar
    COMMAND ./stacionarniRegistar_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
