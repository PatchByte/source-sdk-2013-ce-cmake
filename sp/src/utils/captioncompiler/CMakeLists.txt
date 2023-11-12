project("captioncompiler")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_exe_base.cmake)

set(CAPTIONCOMPILER_SOURCE_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_UTILS}/captioncompiler
)

set(CAPTIONCOMPILER_SOURCE_FILES
    ${CAPTIONCOMPILER_SOURCE_DIRECTORY}/captioncompiler.cpp
    ${CAPTIONCOMPILER_SOURCE_DIRECTORY}/cbase.h

    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.h

    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_helpers.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_helpers.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_init.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_init.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/stringregistry.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/stringregistry.h

    ${SOURCE_SDK_DIRECTORY_COMMON}/compiledcaptionswap.cpp
)

add_executable(${PROJECT_NAME} ${CAPTIONCOMPILER_SOURCE_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}
)

target_link_libraries(${PROJECT_NAME} PRIVATE 
    appframework::appframework
    mathlib::mathlib
    tier2::tier2
    tier3::tier3
)

SOURCE_EXE_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
