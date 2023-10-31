gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_CMAKE_VERSION_KEY} "=" VALUE)

set(GCMAKE_CMAKE_VERSION ${VALUE})

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_NAMESPACE_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_NAMESPACE_KEY} is neither defined nor correct.")
endif()
set(GCMAKE_PROJECT_NAMESPACE ${VALUE})

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_NAME_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_NAME_KEY} is neither defined nor correct.")
endif()
set(GCMAKE_PROJECT_NAME ${VALUE})

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_VERSION_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_VERSION_KEY} is neither defined nor correct.")
endif()
set(GCMAKE_PROJECT_VERSION ${VALUE})

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_DESCRIPTION_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_DESCRIPTION_KEY} is neither defined nor correct.")
endif()
set(GCMAKE_PROJECT_DESCRIPTION ${VALUE})

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_CONTACT_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_CONTACT_KEY} is neither defined nor correct.")
endif()
set(GCMAKE_PROJECT_CONTACT ${VALUE})

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_SYSTEM_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_SYSTEM_KEY} is neither defined nor correct.")
endif()
list(FIND GCMAKE_VALID_PROJECT_SYSTEMS ${VALUE} PROJECT_SYSTEM_RESULT)
if(${PROJECT_SYSTEM_RESULT} EQUAL -1)
    message(FATAL_ERROR "${VALUE} is unsupported system.")
else()
    set(GCMAKE_PROJECT_SYSTEM ${VALUE})
endif()

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_SYSTEM_PROCESSOR_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_SYSTEM_PROCESSOR_KEY} is neither defined nor correct.")
endif()
list(FIND GCMAKE_VALID_PROJECT_SYSTEM_PROCESSORS ${VALUE} PROJECT_SYSTEM_PROCESSOR_RESULT)
if(${PROJECT_SYSTEM_PROCESSOR_RESULT} EQUAL -1)
    message(FATAL_ERROR "${VALUE} is unsupported system processor.")
else()
    set(GCMAKE_PROJECT_SYSTEM_PROCESSOR ${VALUE})   
    if(${GCMAKE_PROJECT_SYSTEM} STREQUAL "local-compile")
        execute_process(
            COMMAND lscpu
            RESULT_VARIABLE LSCPU_RESULT_VARIABLE
            OUTPUT_VARIABLE LSCPU_OUTPUT_VARIABLE
        )
        if(NOT LSCPU_RESULT_VARIABLE EQUAL 0)
            message(FATAL_ERROR "lscpu command returned unexpected value")
        else()
            string(FIND "${LSCPU_OUTPUT_VARIABLE}" ${GCMAKE_PROJECT_SYSTEM_PROCESSOR} VALUE)
            if(${VALUE} EQUAL -1)
                message(FATAL_ERROR "Your system processor is not ${GCMAKE_PROJECT_SYSTEM_PROCESSOR}. Please check it.")        
            endif()
        endif()
    endif()
endif()

gcmake_get_value_file(${GCMAKE_PROJECT_POPERTIES_FILE} ${GCMAKE_PROJECT_SYSTEM_PACKAGE_KEY} "=" VALUE)
if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_SYSTEM_PACKAGE_KEY} is neither defined nor correct.")
endif()
list(FIND GCMAKE_VALID_PROJECT_SYSTEM_PACKAGES ${VALUE} PROJECT_SYSTEM_PACKAGE_RESULT)
if(${PROJECT_SYSTEM_PACKAGE_RESULT} EQUAL -1)
    message(FATAL_ERROR "${VALUE} is unsupported system package.")
else()
    set(GCMAKE_PROJECT_SYSTEM_PACKAGE ${VALUE})
    if(NOT EXISTS "/etc/os-release")
        message(FATAL_ERROR "/etc/os-release file could not be found.")
    endif()
    gcmake_get_value_file("/etc/os-release" "ID_LIKE" "=" VALUE)
    if(${VALUE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
        message(FATAL_ERROR "ID_LIKE value could not found in /etc/os-release file.")
    endif()
    if(NOT ${VALUE} STREQUAL ${GCMAKE_PROJECT_SYSTEM_PACKAGE})
        message(FATAL_ERROR "Your system package system is not ${GCMAKE_PROJECT_SYSTEM_PACKAGE}. Please check it.")
    endif()
endif()
