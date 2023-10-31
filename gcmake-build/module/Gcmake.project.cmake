if(${GCMAKE_CMAKE_VERSION} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CMAKE_VERSION_KEY} is not defined. Please define it.")
endif()

if(${GCMAKE_PROJECT_NAMESPACE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_NAMESPACE_KEY} is not defined. Please define it.")
endif()

if(${GCMAKE_PROJECT_NAME} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_NAME_KEY} is not defined. Please define it.")
endif()

if(${GCMAKE_PROJECT_VERSION} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_VERSION_KEY} is not defined. Please define it.")
endif()

if(${GCMAKE_PROJECT_DESCRIPTION} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_PROJECT_DESCRIPTION_KEY} is not defined. Please define it.")
endif()

if(${GCMAKE_CPACK_GENERATOR} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_CPACK_GENERATOR_KEY} is not defined. Please define it.")
endif()