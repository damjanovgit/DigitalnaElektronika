
cmake_minimum_required(VERSION 3.12)


project(registri_i_brojaci)

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
    NAME dekadniBrojac_test
    COMMAND ./dekadniBrojac_Tb
)
add_test(
    NAME pomjerackiRegistar_test
    COMMAND ./pomjerackiRegistar_tb
)
add_test(
    NAME stacionarniRegistar_test
    COMMAND ./stacionarniRegistar_Tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
