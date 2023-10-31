function(gcmake_target_link_libraries target_name scope link_library_name)
    target_link_libraries(${target_name}
        ${scope}
            ${link_library_name}
    )
endfunction()
