enable_testing()

if(${GCMAKE_GCTEST_ENABLE} STREQUAL ${GCMAKE_VALUE_NOT_FOUND})
    message(FATAL_ERROR "${GCMAKE_GCTEST_ENABLE_KEY} is not defined. Please define it.")
endif()
list(FIND GCMAKE_VALID_GCTEST_ENABLE ${GCMAKE_GCTEST_ENABLE} VALID_GCTEST_ENABLE_RESULT)
if(${VALID_GCTEST_ENABLE_RESULT} EQUAL -1)
    message(FATAL_ERROR "${GCMAKE_GCTEST_ENABLE_KEY} must be true or false.")
endif()

if(${GCMAKE_GCTEST_ENABLE} STREQUAL "true")
    find_package(gctest-core CONFIG 1.0.1 REQUIRED)
endif()
