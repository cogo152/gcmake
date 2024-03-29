set(CPACK_PACKAGE_NAME "${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}" CACHE STRING "package name")
set(CPACK_PACKAGE_CONTACT "${GCMAKE_PROJECT_CONTACT}")
set(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_BINARY_DIR}/package")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/README.md")
set(CPACK_COMPONENTS_GROUPING ALL_COMPONENTS_IN_ONE)
set(CPACK_VERBATIM_VARIABLES TRUE)
set(CPACK_STRIP_FILES TRUE)

get_property(package_dependencies GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES)
list(REMOVE_DUPLICATES package_dependencies)
string(REPLACE ";" ", " package_dependencies "${package_dependencies}")
set_property(GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES ${package_dependencies})

if(${GCMAKE_CPACK_GENERATOR} STREQUAL "DEB")
    set(CPACK_GENERATOR ${GCMAKE_CPACK_GENERATOR})
    include(Gcmake.package.debian)
else()
    message(FATAL_ERROR "Only debian packagin impelented. The others will be implemented later.")
endif()

include(CPack)