vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO debugee/MyLibrary
    REF master
    SHA512 "9da927ab5fbde3a55a69400cab91aff0c246031266a9a19c1f2dda6dfeab2201a99a6e05dbb60e6355793f653b4f49d2c5e1911f17ab8c4e136a6c61c45b2333"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME MyLibrary
)