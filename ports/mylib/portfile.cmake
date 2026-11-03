vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO debugee/MyLibrary
    REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME MyLibrary
    CONFIG_PATH lib/cmake/MyLibrary
)

if(EXISTS "${CURRENT_PACKAGES_DIR}/debug/include")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
endif()

if(EXISTS "${CURRENT_PACKAGES_DIR}/debug/share")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
endif()

file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "MIT License\n")