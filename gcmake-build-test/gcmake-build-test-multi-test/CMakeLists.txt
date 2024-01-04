list(APPEND CMAKE_FIND_ROOT_PATH "$ENV{GCMAKE_HOME}/gcmake-build/build/install")
list(APPEND CMAKE_FIND_ROOT_PATH "$ENV{GCTEST_HOME}/gctest-core/build-local/install")

find_package(gcmake-build REQUIRED) # do not use gcmake_find_add_package

include(Im_Namen_GOTTes)

cmake_minimum_required(VERSION ${GCMAKE_CMAKE_VERSION})

project(${GCMAKE_PROJECT_NAME} VERSION ${GCMAKE_PROJECT_VERSION} DESCRIPTION ${GCMAKE_PROJECT_DESCRIPTION})

set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_VERBOSE_MAKEFILE TRUE)

add_subdirectory(test_1)
add_subdirectory(test_2)

include(GOTT_sei_Dank)