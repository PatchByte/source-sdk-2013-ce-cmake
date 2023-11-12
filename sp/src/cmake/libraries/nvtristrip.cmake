project("nvtristrip")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_lib_base.cmake)

set(NVTRISTRIP_PUBLIC_DIRECTORY
    ${SOURCE_SDK_DIRECTORY_UTILS}/nvtristriplib
)

set(NVTRISTRIP_HEADER_FILES
    ${NVTRISTRIP_PUBLIC_DIRECTORY}/nvtristrip.h
)

set(NVTRISTRIP_SOURCE_FILES
    ${SOURCE_SDK_DIRECTORY_CMAKE}/utility/external-stub-for-libs.cpp
)

add_library(${PROJECT_NAME} STATIC ${NVTRISTRIP_HEADER_FILES} ${NVTRISTRIP_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/nvtristrip.lib)
#elseif(SOURCE_SDK_IS_LINUX)
#    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/linux32/nvtristrip.a)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
