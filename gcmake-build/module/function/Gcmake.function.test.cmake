function(gcmake_validate_test_structor)
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/test")
        message(FATAL_ERROR "test directory must exist.")
    endif()
endfunction()

function(gcmake_add_test test_name test_link_libraries)
    gcmake_validate_test_structor()
    
    set(test_directory ${CMAKE_CURRENT_SOURCE_DIR}/test)
    
    file(GLOB_RECURSE test_sources 
        "${test_directory}/*.s"
        "${test_directory}/*.S"
        "${test_directory}/*.c"
        "${test_directory}/*.cpp"
    )
    
    add_executable(${test_name})

    target_include_directories(${test_name}
        PRIVATE
            ${test_directory}
    )

    target_sources(${test_name}
        PRIVATE
            "${test_sources}"
    )

    target_link_libraries(${test_name}
        PRIVATE 
            ${test_link_libraries}
    )
    
    if(${GCMAKE_GCTEST_ENABLE} STREQUAL "true")
        target_link_libraries(${test_name}
            PUBLIC 
                gctest::core
        )
    endif()
    
    set_target_properties(${test_name}
        PROPERTIES 
            OUTPUT_NAME "${GCMAKE_PROJECT_NAMESPACE}-${test_name}"
    )

    add_test(NAME "${GCMAKE_PROJECT_NAMESPACE}-${test_name}" COMMAND "${GCMAKE_PROJECT_NAMESPACE}-${test_name}")
endfunction()