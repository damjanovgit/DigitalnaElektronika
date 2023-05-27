
cmake_minimum_required(VERSION 3.12)


project(lab8_ram_memorija)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/my_ram_memory.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/my_ram_memory_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e my_ram_memory_tb
)

add_test(
    NAME ram_memory_test_luka_vidic
    COMMAND ./my_ram_memory_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
