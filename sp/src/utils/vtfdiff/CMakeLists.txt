project("vtfdiff")

set(VTFDIFF_SOURCE_DIRECTORY
    ${SOURCE_SDK_DIRECTORY_UTILS}/vtfdiff
)

set(VTFDIFF_SOURCE_FILES
    ${VTFDIFF_SOURCE_DIRECTORY}/vtfdiff.cpp
)

add_executable(${PROJECT_NAME} ${VTFDIFF_SOURCE_FILES})

SOURCE_EXE_BASE_APPLY_PROPERTIES(${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} PRIVATE 
    bitmap::bitmap
    mathlib::mathlib
    tier2::tier2
    vtf::vtf
)
