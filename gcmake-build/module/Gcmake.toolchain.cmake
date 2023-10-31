if(NOT ${GCMAKE_ASM_FLAGS} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    set(CMAKE_ASM_FLAGS ${GCMAKE_ASM_FLAGS} CACHE STRING "asm flags" FORCE)
endif()

if(${GCMAKE_C_COMPILER} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_C_COMPILER_KEY} could not be found.")
endif()
if(${GCMAKE_C_STANDARD} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_C_STANDARD_KEY} could not be found.")
endif()
if(NOT ${GCMAKE_C_FLAGS} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    set(CMAKE_C_FLAGS "${CMAKE_ASM_FLAGS} ${GCMAKE_C_FLAGS}" CACHE STRING "c flags" FORCE)
else()
    set(CMAKE_C_FLAGS "${CMAKE_ASM_FLAGS}" CACHE STRING "c flags" FORCE)
endif()

if(${GCMAKE_CXX_COMPILER} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CXX_COMPILER_KEY} could not be found.")
endif()
if(${GCMAKE_CXX_STANDARD} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CXX_STANDARD_KEY} could not be found.")
endif()
if(NOT ${GCMAKE_CXX_FLAGS} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${GCMAKE_CXX_FLAGS}" CACHE STRING "cpp flags" FORCE)
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "cpp flags" FORCE)
endif()

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "cmake build type" FORCE)
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_VERBOSE_MAKEFILE TRUE)

if(${GCMAKE_CROSSCOMPILING} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_KEY} is not defined. Please define it.")
endif()
list(FIND GCMAKE_VALID_CROSSCOMPILING ${GCMAKE_CROSSCOMPILING} VALID_CROSSCOMPILING_RESULT)
if(${VALID_CROSSCOMPILING_RESULT} EQUAL -1)
    message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_KEY} must be true or false.")
endif()
get_filename_component(current_path ${CMAKE_CURRENT_LIST_DIR} PATH)

if(${GCMAKE_CROSSCOMPILING} STREQUAL "true")
    set(CMAKE_TOOLCHAIN_FILE "${current_path}/build/Gcmake.toolchain.cross.cmake")
else()
    set(CMAKE_TOOLCHAIN_FILE "${current_path}/build/Gcmake.toolchain.local.cmake")
endif()

enable_language(ASM)
enable_language(C)
enable_language(CXX)