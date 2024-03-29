include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

get_property(install_targets GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS)

install(
    TARGETS 
        ${install_targets}
    EXPORT 
        "${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}Targets"
    RUNTIME DESTINATION 
        ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION 
        ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION 
        ${CMAKE_INSTALL_LIBDIR}
    INCLUDES DESTINATION 
        ${CMAKE_INSTALL_INCLUDEDIR}
    PUBLIC_HEADER DESTINATION 
        ${CMAKE_INSTALL_INCLUDEDIR}/${GCMAKE_PROJECT_NAMESPACE}/${GCMAKE_PROJECT_NAME}
)

install(
    EXPORT 
        "${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}Targets"
    FILE 
        "${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}Targets.cmake"
    NAMESPACE 
        ${GCMAKE_PROJECT_NAMESPACE}::
    DESTINATION 
        cmake/${GCMAKE_PROJECT_NAMESPACE}/${GCMAKE_PROJECT_NAME}
)

write_basic_package_version_file(
    "${CMAKE_BINARY_DIR}/${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}ConfigVersion.cmake"
    VERSION 
        "${GCMAKE_PROJECT_VERSION}"
    COMPATIBILITY 
        AnyNewerVersion
)

get_filename_component(current_path ${CMAKE_CURRENT_LIST_DIR} PATH)
cmake_path(GET current_path PARENT_PATH parent_path) 

configure_package_config_file(
    "${current_path}/build/Config.cmake.in"
    "${CMAKE_BINARY_DIR}/${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}Config.cmake"
    INSTALL_DESTINATION 
        cmake
)

install(
    FILES
        "${CMAKE_BINARY_DIR}/${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}Config.cmake"
        "${CMAKE_BINARY_DIR}/${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}ConfigVersion.cmake"
    DESTINATION
        cmake
)

export(
    EXPORT
        "${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}Targets"
    FILE 
        "${CMAKE_BINARY_DIR}/cmake/${GCMAKE_PROJECT_NAMESPACE}-${GCMAKE_PROJECT_NAME}Targets.cmake"
    NAMESPACE
        ${GCMAKE_PROJECT_NAMESPACE}::
)