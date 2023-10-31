
function(gcmake_add_package_dependency package_dependency_name)
    get_property(package_dependencies GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES)

    list(APPEND package_dependencies ${package_dependency_name})
    
    set_property(GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES ${package_dependencies})
endfunction()