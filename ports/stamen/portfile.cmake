vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL git://git.dimitrijedobrota.com/stamen.git
    REF 5694a5e39b554a1c6ba15846ea1f47d8f42f8a9b
    HEAD_REF master
)

set(name stamen)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-D${name}_INSTALL_CMAKEDIR=share/${name}"
    OPTIONS_DEBUG
        "-D${name}_INSTALL_HEADERS=OFF"
)

# set(VCPKG_BUILD_TYPE release) # header-only

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "${name}")
vcpkg_copy_pdbs()


configure_file(
    "${SOURCE_PATH}/LICENSE.md"
    "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright"
    COPYONLY
)
