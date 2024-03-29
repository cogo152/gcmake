set(GCMAKE_PROJECT_PROPERTIES_FILE "${CMAKE_SOURCE_DIR}/Gcmake.properties")
set(GCMAKE_VALUE_NOT_FOUND "VALUE_NOT_FOUND")

set(GCMAKE_CMAKE_VERSION ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CMAKE_VERSION_KEY gcmake_cmake_version)

set(GCMAKE_PROJECT_NAMESPACE ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_PROJECT_NAMESPACE_KEY "gcmake_project_namespace")

set(GCMAKE_PROJECT_NAME ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_PROJECT_NAME_KEY "gcmake_project_name")

set(GCMAKE_PROJECT_VERSION ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_PROJECT_VERSION_KEY "gcmake_project_version")

set(GCMAKE_PROJECT_DESCRIPTION ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_PROJECT_DESCRIPTION_KEY "gcmake_project_description")

set(GCMAKE_PROJECT_CONTACT ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_PROJECT_CONTACT_KEY "gcmake_project_contact")

set(GCMAKE_CPACK_GENERATOR ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CPACK_GENERATOR_KEY "gcmake_cpack_generator")
list(APPEND GCMAKE_VALID_CPACK_GENERATORS "DEB")

set(GCMAKE_BUILD_TYPE ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_BUILD_TYPE_KEY "gcmake_build_type")
list(APPEND GCMAKE_VALID_BUILD_TYPE "Debug" "Release" "RelWithDebInfo" "MinSizeRel")

set(GCMAKE_ASM_COMPILER ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_ASM_COMPILER_KEY "gcmake_asm_compiler")
set(GCMAKE_ASM_FLAGS)
set(GCMAKE_ASM_FLAGS_KEY "gcmake_asm_flags")

set(GCMAKE_C_COMPILER ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_C_COMPILER_KEY "gcmake_c_compiler")
set(GCMAKE_C_STANDARD ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_C_STANDARD_KEY "gcmake_c_standard")
set(GCMAKE_C_FLAGS)
set(GCMAKE_C_FLAGS_KEY "gcmake_c_flags")

set(GCMAKE_CXX_COMPILER ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CXX_COMPILER_KEY "gcmake_cxx_compiler")
set(GCMAKE_CXX_STANDARD ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CXX_STANDARD_KEY "gcmake_cxx_standard")
set(GCMAKE_CXX_FLAGS)
set(GCMAKE_CXX_FLAGS_KEY "gcmake_cxx_flags")

set(GCMAKE_EXE_LINKER_FLAGS)
set(GCMAKE_EXE_LINKER_FLAGS_KEY "gcmake_exe_linker_flags")

set(GCMAKE_CROSSCOMPILING ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CROSSCOMPILING_KEY "gcmake_crosscompiling")
list(APPEND GCMAKE_VALID_CROSSCOMPILING "true" "false")

set(GCMAKE_CROSSCOMPILING_SYSTEM_NAME ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CROSSCOMPILING_SYSTEM_NAME_KEY "gcmake_crosscompiling_system_name")
list(APPEND GCMAKE_VALID_CROSSCOMPILING_SYSTEM_NAMES "Generic;Linux")

set(GCMAKE_CROSSCOMPILING_SYSTEM_PROCESSOR ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CROSSCOMPILING_SYSTEM_PROCESSOR_KEY "gcmake_crosscompiling_system_processor")
list(APPEND GCMAKE_VALID_CROSSCOMPILING_SYSTEM_PROCESSORS "arm;aarch64")

set(GCMAKE_CROSSCOMPILING_TOOLCHAIN_ROOT ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CROSSCOMPILING_TOOLCHAIN_ROOT_KEY "gcmake_crosscompiling_toolchain_root")

set(GCMAKE_CROSSCOMPILING_EMULATOR ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CROSSCOMPILING_EMULATOR_KEY "gcmake_crosscompiling_emulator")

set(GCMAKE_CROSSCOMPILING_EMULATOR_PARAMETERS ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_CROSSCOMPILING_EMULATOR_PARAMETERS_KEY "gcmake_crosscompiling_emulator_parameters")

set(GCMAKE_GCTEST_ENABLE ${GCMAKE_VALUE_NOT_FOUND})
set(GCMAKE_GCTEST_ENABLE_KEY "gcmake_gctest_enable")
list(APPEND GCMAKE_VALID_GCTEST_ENABLE "true" "false")

set_property(GLOBAL PROPERTY GCMAKE_PROJECT_INSTALL_TARGETS ${GCMAKE_PROJECT_INSTALL_TARGETS})
set_property(GLOBAL PROPERTY GCMAKE_PROJECT_PACKAGE_DEPENDENCIES ${GCMAKE_PROJECT_PACKAGE_DEPENDENCIES})

set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE PATH "install directory" FORCE)

