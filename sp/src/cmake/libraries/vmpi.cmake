project("vmpi")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_lib_base.cmake)

set(VMPI_PUBLIC_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_UTILS}/vmpi
)

set(VMPI_HEADER_FILES
    ${VMPI_PUBLIC_DIRECTORY}/ichannel.h
    ${VMPI_PUBLIC_DIRECTORY}/imysqlwrapper.h
    ${VMPI_PUBLIC_DIRECTORY}/iphelpers.h
    ${VMPI_PUBLIC_DIRECTORY}/messbuf.h
    ${VMPI_PUBLIC_DIRECTORY}/threadhelpers.h
    ${VMPI_PUBLIC_DIRECTORY}/vmpi_defs.h
    ${VMPI_PUBLIC_DIRECTORY}/vmpi_dispatch.h
    ${VMPI_PUBLIC_DIRECTORY}/vmpi_distribute_work.h
    ${VMPI_PUBLIC_DIRECTORY}/vmpi_filesystem.h
    ${VMPI_PUBLIC_DIRECTORY}/vmpi_parameters.h
    ${VMPI_PUBLIC_DIRECTORY}/vmpi.h
)

set(VMPI_SOURCE_FILES
    ${SOURCE_SDK_DIRECTORY_CMAKE}/utility/external-stub-for-libs.cpp
)

add_library(${PROJECT_NAME} STATIC ${VMPI_HEADER_FILES} ${VMPI_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/vmpi.lib)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})


