project("tier0")
enable_language(ASM_MASM)

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_lib_base.cmake)

set(TIER0_PUBLIC_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/tier0
)

file(GLOB TIER0_HEADER_FILES
    ${TIER0_PUBLIC_DIRECTORY}/*.h
    ${TIER0_PUBLIC_DIRECTORY}/*.hpp
)

set(TIER0_SOURCE_FILES
    ${TIER0_PUBLIC_DIRECTORY}/memoverride.cpp
)

# I am intentionally removing pointeroverride.asm.
# NO sane human should still use anything under Windows 7

add_library(${PROJECT_NAME} STATIC ${TIER0_HEADER_FILES} ${TIER0_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} PUBLIC ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/tier0.lib)
elseif(SOURCE_SDK_IS_LINUX)
    target_link_libraries(${PROJECT_NAME} PUBLIC ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/linux32/libtier0.so)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
