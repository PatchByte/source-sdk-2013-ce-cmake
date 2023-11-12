project("tier3")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_lib_base.cmake)

set(TIER3_PUBLIC_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/tier3
)

set(TIER3_HEADER_FILES
    ${TIER3_PUBLIC_DIRECTORY}/choreoutils.h
    ${TIER3_PUBLIC_DIRECTORY}/mdlutils.h
    ${TIER3_PUBLIC_DIRECTORY}/scenetokenprocessor.h
    ${TIER3_PUBLIC_DIRECTORY}/tier3.h
    ${TIER3_PUBLIC_DIRECTORY}/tier3dm.h
)

set(TIER3_SOURCE_FILES
    ${SOURCE_SDK_DIRECTORY_CMAKE}/utility/external-stub-for-libs.cpp
)

add_library(${PROJECT_NAME} STATIC ${TIER3_HEADER_FILES} ${TIER3_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/tier3.lib)
elseif(SOURCE_SDK_IS_LINUX)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/linux32/tier3.a)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})

