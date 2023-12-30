function(gcmake_validate_test_structor)
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/test")
        message(FATAL_ERROR "test directory must exist : ${CMAKE_CURRENT_SOURCE_DIR}/test")
    endif()
endfunction()

function(gcmake_add_test)
    gcmake_validate_test_structor()

    set(list_var "${ARGV}")
    list(POP_FRONT list_var test_name)
    list(LENGTH list_var library_size)

    set(test_directory ${CMAKE_CURRENT_SOURCE_DIR}/test)
    
    file(GLOB_RECURSE test_sources
        "${test_directory}/*.s"
        "${test_directory}/*.S"
        "${test_directory}/*.c"
        "${test_directory}/*.cpp"
    )
    
    add_executable(${test_name})

    target_sources(${test_name}
        PRIVATE
            ${test_sources}
    )

    if(${library_size} GREATER 0)
        if(${GCMAKE_GCTEST_ENABLE} STREQUAL "true")
            target_link_libraries(${test_name}
                ${list_var}
                PUBLIC
                    gctest::core_shared
            )
        else()
            target_link_libraries(${test_name}
                ${list_var}
            )
        endif()
    else()
        if(${GCMAKE_GCTEST_ENABLE} STREQUAL "true")
            target_link_libraries(${test_name}
                PUBLIC
                    gctest::core_shared
                )
        endif()
    endif()
        
    set_target_properties(${test_name}
        PROPERTIES 
            OUTPUT_NAME "${GCMAKE_PROJECT_NAMESPACE}-${test_name}"
    )

    if(${GCMAKE_CROSSCOMPILING} STREQUAL "true")
        add_test(NAME "${GCMAKE_PROJECT_NAMESPACE}-${test_name}" COMMAND ${GCMAKE_CROSSCOMPILING_EMULATOR} ${GCMAKE_CROSSCOMPILING_EMULATOR_PARAMETERS} "${GCMAKE_PROJECT_NAMESPACE}-${test_name}")
    else()
        add_test(NAME "${GCMAKE_PROJECT_NAMESPACE}-${test_name}" COMMAND "${GCMAKE_PROJECT_NAMESPACE}-${test_name}")
    endif()
endfunction()
