function(gcmake_validate_executable_structor)
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source")
        message(FATAL_ERROR "source directory must exist.")
    endif()
endfunction()

function(gcmake_add_executable executable_name)
    gcmake_validate_executable_structor()
    
    set(source_directory ${CMAKE_CURRENT_SOURCE_DIR}/source)
    
    file(GLOB_RECURSE sources 
        "${source_directory}/*.s"
        "${source_directory}/*.S"
        "${source_directory}/*.c"
        "${source_directory}/*.cpp"
    )

    add_executable(${executable_name})

    target_include_directories(${executable_name}
        PRIVATE
            ${source_directory}
    )

    target_sources(${executable_name}
        PRIVATE
            "${sources}"
    )

    set_target_properties(${executable_name} 
        PROPERTIES 
            DEBUG_POSTFIX 
                "d"
    )

    set_target_properties(${executable_name}
        PROPERTIES 
            OUTPUT_NAME "${GCMAKE_PROJECT_NAMESPACE}-${executable_name}"
    )

    get_property(install_targets GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS)
    list(APPEND install_targets ${executable_name})
    set_property(GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS ${install_targets})
endfunction()