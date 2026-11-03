vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO debugee/mytool
    REF "10.0"
    SHA512 "ec7c3b1c03aaeadf2af9bb84cdce9b751b4fa1e8121a3bad42a20cf528ec3f0011946292766e8944ef41c750e117158303b3faa682b79c46ffa3c83bd6484bed"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()
