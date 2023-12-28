
function(gcmake_find_add_package)
    find_package(${ARGV})

    get_property(package_dependencies GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES)
    list(APPEND package_dependencies ${ARGV0})
    set_property(GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES ${package_dependencies})
endfunction()

function(gcmake_add_packages)
    get_property(package_dependencies GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES)
    list(APPEND package_dependencies ${ARGV})
    set_property(GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES ${package_dependencies})
endfunction()