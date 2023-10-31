function(gcmake_validate_library_structor)
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/include")
        message(FATAL_ERROR "include directory must exist.")
    endif()
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source")
        message(FATAL_ERROR "source directory must exist.")
    endif()
endfunction()

function(gcmake_add_library library_name type)
    gcmake_validate_library_structor()
    
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
                  
    add_library(${library_name} ${type})

    target_include_directories(${library_name}
        PRIVATE
            ${source_directory}
        PUBLIC
            $<BUILD_INTERFACE:${include_directory}>
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    )

    target_sources(${library_name}
        PRIVATE
            "${sources}"
    )

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