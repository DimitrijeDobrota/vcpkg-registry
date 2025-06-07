vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL git://git.dimitrijedobrota.com/alec.git
    REF b02e0ba34e3a27238bfa660bedf1e87fb6313f15
    HEAD_REF master
)

set(name alec)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-D${name}_INSTALL_CMAKEDIR=share/${name}"
)

set(VCPKG_BUILD_TYPE release) # header-only

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "${name}")
vcpkg_copy_pdbs()


configure_file(
    "${SOURCE_PATH}/LICENSE.md"
    "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright"
    COPYONLY
)
