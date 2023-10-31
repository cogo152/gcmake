set(CMAKE_SYSTEM_NAME ${GCMAKE_CROSSCOMPILING_SYSTEM_NAME})
set(CMAKE_SYSTEM_PROCESSOR ${GCMAKE_CROSSCOMPILING_SYSTEM_PROCESSOR})
set(CMAKE_CROSSCOMPILING TRUE)

set(CMAKE_C_COMPILER ${GCMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER ${GCMAKE_CXX_COMPILER})

list(APPEND CMAKE_FIND_ROOT_PATH ${GCMAKE_CROSSCOMPILING_TOOLCHAIN_ROOT})
list(APPEND CMAKE_INSTALL_RPATH "${GCMAKE_CROSSCOMPILING_TOOLCHAIN_ROOT}/lib") # for auto dependency maybe find_package
set(CMAKE_CROSSCOMPILING_EMULATOR ${GCMAKE_CROSSCOMPILING_EMULATOR} CACHE FILEPATH "Path to the emulator for the target system.")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

set(CMAKE_C_STANDARD ${GCMAKE_C_STANDARD})
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD ${GCMAKE_CXX_STANDARD})
set(CMAKE_CXX_STANDARD_REQUIRED ON)