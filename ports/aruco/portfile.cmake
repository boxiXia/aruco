vcpkg_buildpath_length_warning(37)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boxiXia/aruco
    REF 3.1.12
    SHA512 0
    HEAD_REF main
    # PATCHES
    #     disable_pkgconfig_absolute_path_check.patch
    #     fix-cuda-error.patch # issue https://gitlab.com/libeigen/eigen/-/issues/1526
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DUSE_OWN_EIGEN3=OFF
        -DBUILD_UTILS=OFF
        -DBUILD_SVM=OFF
        -DBUILD_UTILS=OFF
        -DBUILD_TESTS=OFF
        -DARUCO_DEVINSTALL=ON
    # OPTIONS_RELEASE
    #     -DCMAKEPACKAGE_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/share/aruco
        # -DPKGCONFIG_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/lib/pkgconfig
    # OPTIONS_DEBUG
    #     -DCMAKEPACKAGE_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/debug/share/aruco
        # -DPKGCONFIG_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig
)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()
# vcpkg_fixup_pkgconfig()

file(GLOB INCLUDES ${CURRENT_PACKAGES_DIR}/include/aruco/*)
# # Copy the eigen header files to conventional location for user-wide MSBuild integration
file(COPY ${INCLUDES} DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/License-gpl.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
