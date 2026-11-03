vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO debugee/MyLibrary
    REF 1.0
    SHA512 "cba2f3ca26f01a066570e36a7e2ed16a8b4b30baeabdc464471ffebaa57a6763c3d102d1a61d85677d45449f8f9691e9ca6cfc25d25378ac8d32aafe47b30872"
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" MYLIBRARY_BUILD_SHARED)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_SHARED_LIBS=${MYLIBRARY_BUILD_SHARED}
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