get_filename_component(current_path ${CMAKE_SOURCE_DIR} PATH)
cmake_path(GET current_path PARENT_PATH parent_path)

list(APPEND CMAKE_FIND_ROOT_PATH "${parent_path}/gcmake-build/build/install")
find_package(gcmake-build REQUIRED)

include(Im_Namen_GOTTes)

cmake_minimum_required(VERSION ${GCMAKE_CMAKE_VERSION})

project(${GCMAKE_PROJECT_NAME} VERSION ${GCMAKE_PROJECT_VERSION} DESCRIPTION ${GCMAKE_PROJECT_DESCRIPTION})

set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_VERBOSE_MAKEFILE TRUE)

add_subdirectory(test_1)
add_subdirectory(test_2)

include(GOTT_sei_Dank)