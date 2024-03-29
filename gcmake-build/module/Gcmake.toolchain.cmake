if(${GCMAKE_BUILD_TYPE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_BUILD_TYPE_KEY} could not be found.")
endif()
list(FIND GCMAKE_VALID_BUILD_TYPE ${GCMAKE_BUILD_TYPE} VALID_GCMAKE_BUILD_TYPE_RESULT)
if(${VALID_GCMAKE_BUILD_TYPE_RESULT} EQUAL -1)
    message(FATAL_ERROR "${GCMAKE_BUILD_TYPE_KEY} must be Debug or Release or RelWithDebInfo or MinSizeRel.")
else()
    set(CMAKE_BUILD_TYPE ${GCMAKE_BUILD_TYPE} CACHE INTERNAL "cmake build type" FORCE)
endif()

if(${GCMAKE_ASM_COMPILER} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_ASM_COMPILER_KEY} could not be found.")
endif()
if(NOT ${GCMAKE_ASM_FLAGS} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    set(CMAKE_ASM_FLAGS ${GCMAKE_ASM_FLAGS} CACHE INTERNAL "asm flags" FORCE)
endif()

if(${GCMAKE_C_COMPILER} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_C_COMPILER_KEY} could not be found.")
endif()
if(${GCMAKE_C_STANDARD} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_C_STANDARD_KEY} could not be found.")
endif()
if(NOT ${GCMAKE_C_FLAGS} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    set(CMAKE_C_FLAGS "${CMAKE_ASM_FLAGS} ${GCMAKE_C_FLAGS}" CACHE INTERNAL "c flags" FORCE)
else()
    set(CMAKE_C_FLAGS "${CMAKE_ASM_FLAGS}" CACHE INTERNAL "c flags" FORCE)
endif()

if(${GCMAKE_CXX_COMPILER} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CXX_COMPILER_KEY} could not be found.")
endif()
if(${GCMAKE_CXX_STANDARD} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CXX_STANDARD_KEY} could not be found.")
endif()
if(NOT ${GCMAKE_CXX_FLAGS} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${GCMAKE_CXX_FLAGS}" CACHE INTERNAL "cpp flags" FORCE)
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}" CACHE INTERNAL "cpp flags" FORCE)
endif()

if(NOT ${GCMAKE_EXE_LINKER_FLAGS} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    set(CMAKE_EXE_LINKER_FLAGS  ${GCMAKE_EXE_LINKER_FLAGS} CACHE INTERNAL "linker flags" FORCE)
endif()

if(${GCMAKE_CROSSCOMPILING} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_KEY} is not defined. Please define it.")
endif()
list(FIND GCMAKE_VALID_CROSSCOMPILING ${GCMAKE_CROSSCOMPILING} VALID_CROSSCOMPILING_RESULT)
if(${VALID_CROSSCOMPILING_RESULT} EQUAL -1)
    message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_KEY} must be true or false.")
endif()
get_filename_component(current_path ${CMAKE_CURRENT_LIST_DIR} PATH)
if(${GCMAKE_CROSSCOMPILING} STREQUAL "true")
    if(${GCMAKE_CROSSCOMPILING_SYSTEM_NAME} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
        message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_SYSTEM_NAME_KEY} is not defined. Please define it.")
    endif()
    list(FIND GCMAKE_VALID_CROSSCOMPILING_SYSTEM_NAMES ${GCMAKE_CROSSCOMPILING_SYSTEM_NAME} VALID_CROSSCOMPILING_SYSTEM_NAME_RESULT)
    if(${VALID_CROSSCOMPILING_SYSTEM_NAME_RESULT} EQUAL -1)
        message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_SYSTEM_NAME_KEY} must be Linux.")
    endif()

    if(${GCMAKE_CROSSCOMPILING_SYSTEM_PROCESSOR} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
        message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_SYSTEM_PROCESSOR_KEY} is not defined. Please define it.")
    endif()
    list(FIND GCMAKE_VALID_CROSSCOMPILING_SYSTEM_PROCESSORS ${GCMAKE_CROSSCOMPILING_SYSTEM_PROCESSOR} VALID_CROSSCOMPILING_SYSTEM_PROCESSOR_RESULT)
    if(${VALID_CROSSCOMPILING_SYSTEM_PROCESSOR_RESULT} EQUAL -1)
        message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_SYSTEM_PROCESSOR_KEY} must be aarch64.")
    endif()

    if(${GCMAKE_CROSSCOMPILING_TOOLCHAIN_ROOT} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
        message(FATAL_ERROR "${GCMAKE_CROSSCOMPILING_TOOLCHAIN_ROOT_KEY} is not defined. Please define it.")
    endif()

    set(CMAKE_TOOLCHAIN_FILE "${current_path}/build/Gcmake.toolchain.cross.cmake")
else()
    set(CMAKE_TOOLCHAIN_FILE "${current_path}/build/Gcmake.toolchain.local.cmake")
endif()

enable_language(ASM)
enable_language(C)
enable_language(CXX)