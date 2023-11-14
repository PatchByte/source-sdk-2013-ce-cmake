project("vice")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_exe_base.cmake)

set(VICE_SOURCE_DIRECTORY ${SOURCE_SDK_DIRECTORY_UTILS}/vice)

# Why do we have to externally include ${SOURCE_SDK_DIRECTORY_UTILS_COMMON} stuff here. This is not a good design.

set(VICE_SOURCE_FILES
    vice.cpp
    
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.cpp

    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_helpers.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_init.cpp
)

# See above.

set(VICE_HEADER_FILES
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.h
)

add_executable(${PROJECT_NAME} ${VICE_HEADER_FILES} ${VICE_SOURCE_FILES})

SOURCE_EXE_BASE_APPLY_PROPERTIES(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PRIVATE 
    ${VICE_SOURCE_DIRECTORY}
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}
)

target_link_libraries(${PROJECT_NAME} PRIVATE mathlib::mathlib tier2::tier2)

