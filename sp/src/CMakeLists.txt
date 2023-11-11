cmake_minimum_required(VERSION 3.24)
project("sp-src")

option(SOURCE_SDK_USE_64_BIT "Special 64 build, not supported yet." OFF)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/archive)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/shared)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/binary)

set(SOURCE_SDK_DIRECTORY_BASE ${CMAKE_CURRENT_SOURCE_DIR}/)
set(SOURCE_SDK_DIRECTORY_COMMON ${CMAKE_CURRENT_SOURCE_DIR}/common)
set(SOURCE_SDK_DIRECTORY_PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/public)
set(SOURCE_SDK_DIRECTORY_CMAKE ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
set(SOURCE_SDK_DIRECTORY_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/lib)
set(SOURCE_SDK_DIRECTORY_GAME_LIBRARIES ${SOURCE_SDK_DIRECTORY_LIBRARIES}/public)
set(SOURCE_SDK_DIRECTORY_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/utils)
set(SOURCE_SDK_DIRECTORY_UTILS_COMMON ${CMAKE_CURRENT_SOURCE_DIR}/utils/common)

set(SOURCE_SDK_IS_WINDOWS false)
set(SOURCE_SDK_IS_LINUX false)
set(SOURCE_SDK_IS_POSIX false)

if(CMAKE_HOST_WIN32)
    message(":D Using source-sdk-2013-ce on windows, have a nice day.")
    
    set(SOURCE_SDK_IS_WINDOWS 1)

    if(SOURCE_SDK_USE_64_BIT)
        set(SOURCE_SDK_OS "WIN64")
        set(SOURCE_SDK_IS_WIN64 1)
    
        message("D: Detected Win64.")
        message(FATAL_ERROR "Win64 not supported yet.")
    else()
        set(SOURCE_SDK_OS "WIN32")
        set(SOURCE_SDK_IS_WIN32 1)

        message(":D Detected Win32.")
    endif()
elseif(not CMAKE_HOST_WIN32)
    message(FATAL_ERROR "Not supported yet, but will come.")
endif()

if(CMAKE_HOST_WIN32)
    set(CompilerFlags
        CMAKE_CXX_FLAGS
        CMAKE_CXX_FLAGS_DEBUG
        CMAKE_CXX_FLAGS_RELEASE
        CMAKE_CXX_FLAGS_MINSIZEREL
        CMAKE_CXX_FLAGS_RELWITHDEBINFO
        CMAKE_C_FLAGS
        CMAKE_C_FLAGS_DEBUG
        CMAKE_C_FLAGS_RELEASE
        CMAKE_C_FLAGS_MINSIZEREL
        CMAKE_C_FLAGS_RELWITHDEBINFO
    )
    foreach(CompilerFlag ${CompilerFlags})
        string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
        set(${CompilerFlag} "${${CompilerFlag}}" CACHE STRING "msvc compiler flags" FORCE)
        message("MSVC flags: ${CompilerFlag}:${${CompilerFlag}}")
    endforeach()

    foreach(flag_var CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE
                CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO)
        string(REPLACE /GR /GR- "${flag_var}" "${${flag_var}}")
        string(REPLACE /EHsc /EHsc- "${flag_var}" "${${flag_var}}")
        string(REPLACE /EHs /EHs- "${flag_var}" "${${flag_var}}")
    endforeach()
endif()

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_base.cmake)
include(${SOURCE_SDK_DIRECTORY_CMAKE}/build.cmake)

add_subdirectory(mathlib)
add_subdirectory(fgdlib)
add_subdirectory(tier1)

add_subdirectory(utils/height2normal)
add_subdirectory(utils/vice)

# add_subdirectory(utils/glview)
