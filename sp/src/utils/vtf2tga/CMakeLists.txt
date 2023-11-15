project("vtf2tga")

set(VTF2TGA_SOURCE_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_UTILS}/vtf2tga
)

set(VTF2TGA_SOURCE_FILES
    ${VTF2TGA_SOURCE_DIRECTORY}/vtf2tga.cpp
)

add_executable(${PROJECT_NAME} ${VTF2TGA_SOURCE_FILES})

SOURCE_EXE_BASE_APPLY_PROPERTIES(${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} PRIVATE 
    bitmap::bitmap
    mathlib::mathlib
    tier2::tier2
    vtf::vtf
)
