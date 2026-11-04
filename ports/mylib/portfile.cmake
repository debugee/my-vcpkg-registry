vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO debugee/MyLibrary
    REF 2.0
    SHA512 "d4642568b83e338aedb87fcd366372fd8ea3ebd4ead8fb69ab802af3f8331581bc6f71cd99532af37983abee07caf0b32d167e012c3945bde013badec593f9bd"
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