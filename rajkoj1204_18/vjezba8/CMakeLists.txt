
cmake_minimum_required(VERSION 3.12)


project(ram)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/ram.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/ram_tb.vhdl

)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e RAM_TB
 
)

add_test(
    NAME ram_test
    COMMAND ./RAM_TB
)


set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
