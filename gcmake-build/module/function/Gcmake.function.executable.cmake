function(gcmake_validate_executable_structor)
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source")
        message(FATAL_ERROR "source directory must exist  : ${CMAKE_CURRENT_SOURCE_DIR}/source")
    endif()
endfunction()

function(gcmake_add_executable)
    gcmake_validate_executable_structor()

    set(list_var "${ARGV}")
    list(POP_FRONT list_var executable_name)
    list(LENGTH list_var library_size)
    
    set(include_directory ${CMAKE_CURRENT_SOURCE_DIR}/include)
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
            ${include_directory}
    )

    target_sources(${executable_name}
        PRIVATE
            ${sources}
    )

    if(${library_size} GREATER 0)
        target_link_libraries(${executable_name}
            ${list_var}
        )
    endif()

    set_target_properties(${executable_name}
        PROPERTIES 
            OUTPUT_NAME "${GCMAKE_PROJECT_NAMESPACE}-${executable_name}"
    )

    get_property(install_targets GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS)
    list(APPEND install_targets ${executable_name})
    set_property(GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS ${install_targets})
endfunction()