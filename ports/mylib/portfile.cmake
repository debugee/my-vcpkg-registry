vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO debugee/mytool
    REF "10.0"
    SHA512 "8397b1c19cb32d64803c8972f9fc952ea262e5576d5934b20946a28714a2c8736c091d44fe8e1be17927fce94f46eb4b380dd09b45a61b43586505c5f0d7215e"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()
