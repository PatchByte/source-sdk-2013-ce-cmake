project("motionmapper")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_exe_base.cmake)

set(MOTIONMAPPER_SOURCE_DIRECTORY
    ${SOURCE_SDK_DIRECTORY_UTILS}/motionmapper
)

set(MOTIONMAPPER_SOURCE_FILES
    ${MOTIONMAPPER_SOURCE_DIRECTORY}/motionmapper.cpp
    ${MOTIONMAPPER_SOURCE_DIRECTORY}/motionmapper.h

    # This engine...

    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.h

    # makes me go insane, ...

    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_helpers.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_helpers.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_init.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_init.h

    # but we all love this engine so much
)

add_executable(${PROJECT_NAME} ${MOTIONMAPPER_SOURCE_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE
    ${SOURCE_SDK_DIRECTORY_UTILS}/nvtristriplib
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}
)

target_link_libraries(${PROJECT_NAME} PRIVATE 
    tier0::tier0
    tier1::tier1
    tier2::tier2
    mathlib::mathlib
    nvtristrip::nvtristrip
)

SOURCE_EXE_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
