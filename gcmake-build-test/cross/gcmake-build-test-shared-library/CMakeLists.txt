get_filename_component(current_path ${CMAKE_SOURCE_DIR} PATH)
cmake_path(GET current_path PARENT_PATH parent_path)

list(APPEND CMAKE_FIND_ROOT_PATH "${parent_path}/../gcmake-build/build/install")
list(APPEND CMAKE_FIND_ROOT_PATH "${parent_path}/../../gctest/gctest-core/build/install")

find_package(gcmake-build CONFIG 1.1.0 REQUIRED) # do not use gcmake_find_add_package

include(Im_Namen_GOTTes)

cmake_minimum_required(VERSION ${GCMAKE_CMAKE_VERSION})

project(${GCMAKE_PROJECT_NAME} VERSION ${GCMAKE_PROJECT_VERSION} DESCRIPTION ${GCMAKE_PROJECT_DESCRIPTION})

find_package(Threads REQUIRED) # does not add auto dependency

# Could NOT find JNI (missing: JAVA_AWT_LIBRARY JAVA_JVM_LIBRARY
#find_package(JNI REQUIRED) # does not add auto dependency

gcmake_find_add_package(gctest-core REQUIRED) # adds auto dependency

gcmake_add_library(${GCMAKE_PROJECT_NAME}_lib SHARED
    PUBLIC
        ${CMAKE_THREAD_LIBS_INIT}
        #${JNI_LIBRARIES} 
)

gcmake_add_packages(
    x11-common # add manuel dependency
    x11-common # must remove duplicates
    x11-apps # add manuel dependency
)

gcmake_add_test(${GCMAKE_PROJECT_NAME}_lib_test
    PRIVATE
        ${GCMAKE_PROJECT_NAME}_lib
)

include(GOTT_sei_Dank)