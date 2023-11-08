project("tier2")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_lib_base.cmake)

set(TIER2_PUBLIC_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/tier2
)

set(TIER2_HEADER_FILES
    ${TIER2_PUBLIC_DIRECTORY}/beamsegdraw.h
    ${TIER2_PUBLIC_DIRECTORY}/camerautils.h
    ${TIER2_PUBLIC_DIRECTORY}/fileutils.h
    ${TIER2_PUBLIC_DIRECTORY}/keybindings.h
    ${TIER2_PUBLIC_DIRECTORY}/meshutils.h
    ${TIER2_PUBLIC_DIRECTORY}/p4helpers.h
    ${TIER2_PUBLIC_DIRECTORY}/renderutils.h
    ${TIER2_PUBLIC_DIRECTORY}/riff.h
    ${TIER2_PUBLIC_DIRECTORY}/tier2.h
    ${TIER2_PUBLIC_DIRECTORY}/tier2dm.h
    ${TIER2_PUBLIC_DIRECTORY}/utlstreambuffer.h
    ${TIER2_PUBLIC_DIRECTORY}/vconfig.h
)

set(TIER2_SOURCE_FILES
    ${SOURCE_SDK_DIRECTORY_CMAKE}/utility/external-stub-for-libs.c
)

add_library(${PROJECT_NAME} STATIC ${TIER2_HEADER_FILES} ${TIER2_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} PUBLIC ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/tier2.lib)
elseif(SOURCE_SDK_IS_LINUX)
    target_link_libraries(${PROJECT_NAME} PUBLIC ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/linux32/tier2.a)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
