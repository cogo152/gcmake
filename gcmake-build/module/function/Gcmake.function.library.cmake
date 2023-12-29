function(gcmake_validate_library_structor)
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/include")
        message(FATAL_ERROR "include directory must exist : ${CMAKE_CURRENT_SOURCE_DIR}/include")
    endif()
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source")
        message(FATAL_ERROR "source directory must exist : ${CMAKE_CURRENT_SOURCE_DIR}/source")
    endif()
endfunction()

function(gcmake_add_library)
    gcmake_validate_library_structor()

    set(list_var "${ARGV}")
    list(POP_FRONT list_var library_name)
    list(POP_FRONT list_var library_type)
    list(LENGTH list_var library_size)
    
    set(include_directory ${CMAKE_CURRENT_SOURCE_DIR}/include)
    set(source_directory ${CMAKE_CURRENT_SOURCE_DIR}/source)

    file(GLOB_RECURSE public_headers 
        "${include_directory}/*.h" 
        "${include_directory}/*.hpp"
    )

    file(GLOB_RECURSE sources 
        "${source_directory}/*.s"
        "${source_directory}/*.S"
        "${source_directory}/*.c"
        "${source_directory}/*.cpp"
    )
                  
    add_library(${library_name} ${library_type})

    target_include_directories(${library_name}
        PRIVATE
            ${source_directory}
        PUBLIC
            $<BUILD_INTERFACE:${include_directory}>
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    )

    target_sources(${library_name}
        PRIVATE
            ${sources}
    )

    if(${library_size} GREATER 0)
        target_link_libraries(${library_name}
            ${list_var}
        )
    endif()

    set_target_properties(${library_name}
        PROPERTIES 
            PUBLIC_HEADER
                "${public_headers}"
    )

    set_target_properties(${library_name} 
        PROPERTIES 
            DEBUG_POSTFIX 
                "d"
    )

    set_target_properties(${library_name}
        PROPERTIES 
            OUTPUT_NAME "${GCMAKE_PROJECT_NAMESPACE}-${library_name}"
    )

    get_property(install_targets GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS)
    list(APPEND install_targets ${library_name})
    set_property(GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS ${install_targets})
endfunction()