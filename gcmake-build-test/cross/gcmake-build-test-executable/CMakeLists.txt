list(APPEND CMAKE_FIND_ROOT_PATH "$ENV{GCMAKE_HOME}/gcmake-build/build/install")
list(APPEND CMAKE_FIND_ROOT_PATH "$ENV{GCMAKE_HOME}/gcmake-build-test/cross/gcmake-build-test-shared-library/build/install")
list(APPEND CMAKE_FIND_ROOT_PATH "$ENV{GCTEST_HOME}/gctest-core/build-arm64/install")

find_package(gcmake-build REQUIRED) # do not use gcmake_find_add_package

include(Im_Namen_GOTTes)

cmake_minimum_required(VERSION ${GCMAKE_CMAKE_VERSION})

project(${GCMAKE_PROJECT_NAME} VERSION ${GCMAKE_PROJECT_VERSION} DESCRIPTION ${GCMAKE_PROJECT_DESCRIPTION})

find_package(Threads REQUIRED) # does not add auto dependency

# Could NOT find JNI (missing: JAVA_AWT_LIBRARY JAVA_JVM_LIBRARY
#find_package(JNI REQUIRED) # does not add auto dependency

gcmake_find_add_package(gcmake-build-test-shared-library REQUIRED) # adds auto dependency
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

include(GOTT_sei_Dank)
