if(NOT ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Linux")
    message(FATAL_ERROR "This project is supported only on the Linux OS")
endif()

execute_process(
    COMMAND make --version
    RESULT_VARIABLE MAKE_RESULT_VARIABLE
)
if(NOT ${MAKE_RESULT_VARIABLE} EQUAL 0)
    message(FATAL_ERROR "Program make does not exist in bin path. Please install it.")
endif()

if(NOT CMAKE_GENERATOR)
        set(CMAKE_GENERATOR "Unix Makefiles" CACHE INTERNAL "cmake generator" FORCE)
endif()