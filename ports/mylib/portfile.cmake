vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO debugee/MyLibrary
    REF master
    SHA512 "2c2aeeedb768fe7d0ab289949ac0af4500c50c1d71aaf4822bbe9269edbc13eef460c648ac44b72f7b292da7dac77cd10b050219cad2d33d029279396652f060"
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