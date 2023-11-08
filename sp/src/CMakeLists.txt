cmake_minimum_required(VERSION 3.24)
project("sp-src")

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/archive)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/shared)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/binary)

set(SOURCE_SDK_DIRECTORY_BASE ${CMAKE_CURRENT_SOURCE_DIR}/)
set(SOURCE_SDK_DIRECTORY_PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/public)
set(SOURCE_SDK_DIRECTORY_CMAKE ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(SOURCE_SDK_IS_WINDOWS false)
set(SOURCE_SDK_IS_LINUX false)
set(SOURCE_SDK_IS_POSIX false)

if(CMAKE_HOST_WIN32)
    message(":D Using source-sdk-2013-ce on windows, have a nice day.")
    
    set(SOURCE_SDK_IS_WINDOWS 1)

    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(SOURCE_SDK_OS "WIN64")
        set(SOURCE_SDK_IS_WIN64 1)
    
        message(":D Detected Win64.")
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        set(SOURCE_SDK_OS "WIN32")
        set(SOURCE_SDK_IS_WIN32 1)

        message(":D Detected Win32.")
    else()
        message(FATAL_ERROR "D: Architecture could not be detected. " ${CMAKE_SIZEOF_VOID_P})
    endif()
elseif(not CMAKE_HOST_WIN32)
    message(FATAL_ERROR "Not supported yet, but will come.")
endif()

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_base.cmake)

add_subdirectory(mathlib)
