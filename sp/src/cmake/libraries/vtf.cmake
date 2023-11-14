project("vtf")

set(VTF_PUBLIC_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/vtf
)

set(VTF_HEADER_FILES
    ${VTF_PUBLIC_DIRECTORY}/vtf.h
)

set(VTF_SOURCE_FILES
    ${SOURCE_SDK_DIRECTORY_CMAKE}/utility/external-stub-for-libs.cpp
)

add_library(${PROJECT_NAME} STATIC ${VTF_HEADER_FILES} ${VTF_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/vtf.lib)
elseif(SOURCE_SDK_IS_LINUX)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/linux32/vtf.a)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
