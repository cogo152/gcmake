get_filename_component(current_path ${CMAKE_SOURCE_DIR} PATH)
cmake_path(GET current_path PARENT_PATH parent_path)

list(APPEND CMAKE_FIND_ROOT_PATH "${parent_path}/../gcmake-build/build/install")
list(APPEND CMAKE_FIND_ROOT_PATH "${current_path}/gcmake-build-test-shared-library/build/install")

find_package(gcmake-build CONFIG 1.0.6 REQUIRED) # do not use gcmake_find_add_package

include(Gcmake_Begin)

cmake_minimum_required(VERSION ${GCMAKE_CMAKE_VERSION})

project(${GCMAKE_PROJECT_NAME} VERSION ${GCMAKE_PROJECT_VERSION} DESCRIPTION ${GCMAKE_PROJECT_DESCRIPTION})

find_package(Threads REQUIRED) # does not add auto dependency

# Could NOT find JNI (missing: JAVA_AWT_LIBRARY JAVA_JVM_LIBRARY
#find_package(JNI REQUIRED) # does not add auto dependency

gcmake_find_add_package(gcmake-build-test-shared-library CONFIG 1.0.6 REQUIRED) # adds auto dependency
gcmake_find_add_package(gctest-core REQUIRED) # adds auto dependency

gcmake_add_executable(${GCMAKE_PROJECT_NAME}_exec
    PRIVATE 
        gcmake::build-test-shared-library_lib
    PUBLIC
        ${CMAKE_THREAD_LIBS_INIT}
        # ${JNI_LIBRARIES} 
)

gcmake_add_packages( 
    x11-common # add manuel dependency
    x11-common # must remove duplicates
    x11-apps # add manuel dependency
)

include(Gcmake_End)
