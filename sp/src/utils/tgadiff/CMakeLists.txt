project("tgadiff")

set(TGADIFF_SOURCE_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_UTILS}/tgadiff
)

set(TGADIFF_SOURCE_FILES
    ${TGADIFF_SOURCE_DIRECTORY}/tgadiff.cpp
)

add_executable(${PROJECT_NAME} ${TGADIFF_SOURCE_FILES})

SOURCE_EXE_BASE_APPLY_PROPERTIES(${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} PRIVATE 
    bitmap::bitmap
    mathlib::mathlib
    tier2::tier2
)
