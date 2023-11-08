project("bitmap")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_lib_base.cmake)

set(BITMAP_PUBLIC_DIRECTORY
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/bitmap
)

set(BITMAP_HEADER_FILES
    ${BITMAP_PUBLIC_DIRECTORY}/bitmap.h
    ${BITMAP_PUBLIC_DIRECTORY}/cubemap.h
    ${BITMAP_PUBLIC_DIRECTORY}/float_bm.h
    ${BITMAP_PUBLIC_DIRECTORY}/imageformat.h
    ${BITMAP_PUBLIC_DIRECTORY}/psd.h
    ${BITMAP_PUBLIC_DIRECTORY}/tgaloader.h
    ${BITMAP_PUBLIC_DIRECTORY}/tgawriter.h
)

set(BITMAP_SOURCE_FILES
    ${SOURCE_SDK_DIRECTORY_CMAKE}/utility/external-stub-for-libs.c
)

add_library(${PROJECT_NAME} STATIC ${BITMAP_HEADER_FILES} ${BITMAP_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} PUBLIC ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/bitmap.lib)
elseif(SOURCE_SDK_IS_LINUX)
    target_link_libraries(${PROJECT_NAME} PUBLIC ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/linux32/bitmap.lib)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
