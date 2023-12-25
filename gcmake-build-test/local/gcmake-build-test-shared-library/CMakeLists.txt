get_filename_component(current_path ${CMAKE_SOURCE_DIR} PATH)
cmake_path(GET current_path PARENT_PATH parent_path)

list(APPEND CMAKE_FIND_ROOT_PATH "${parent_path}/../gcmake-build/build/install")

find_package(gcmake-build CONFIG 1.1.5 REQUIRED)

include(Gcmake_Begin)

cmake_minimum_required(VERSION ${GCMAKE_CMAKE_VERSION})

project(${GCMAKE_PROJECT_NAME} VERSION ${GCMAKE_PROJECT_VERSION} DESCRIPTION ${GCMAKE_PROJECT_DESCRIPTION})

gcmake_add_library(${GCMAKE_PROJECT_NAME}_lib SHARED)

gcmake_add_test(${GCMAKE_PROJECT_NAME}_lib_test ${GCMAKE_PROJECT_NAME}_lib)

include(Gcmake_End)