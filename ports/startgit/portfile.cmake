vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL git://git.dimitrijedobrota.com/startgit.git
    REF d2592e66201692b5e60b8cb4f5d1f6ba79b8a58e
    HEAD_REF master
)

set(name startgit)

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
