get_filename_component(current_path ${CMAKE_SOURCE_DIR} PATH)
cmake_path(GET current_path PARENT_PATH parent_path)

list(APPEND CMAKE_FIND_ROOT_PATH "${parent_path}/../gcmake-build/build/install")
list(APPEND CMAKE_FIND_ROOT_PATH "${current_path}/gcmake-build-test-shared-library/build/install")

find_package(gcmake-build CONFIG 1.0.6 REQUIRED)

include(Gcmake_Begin)

cmake_minimum_required(VERSION ${GCMAKE_CMAKE_VERSION})

project(${GCMAKE_PROJECT_NAME} VERSION ${GCMAKE_PROJECT_VERSION} DESCRIPTION ${GCMAKE_PROJECT_DESCRIPTION})

find_package(gcmake-build-test-shared-library CONFIG 1.0.6 REQUIRED)

gcmake_add_executable(${GCMAKE_PROJECT_NAME}_exec
    PRIVATE 
        gcmake::build-test-shared-library_lib
)

gcmake_add_package_dependency("gcmake-build-test-shared-library")

include(Gcmake_End)
