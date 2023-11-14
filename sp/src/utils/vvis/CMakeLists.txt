project("vvis_dll")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_dll_base.cmake)

set(VVIS_SOURCE_DIRECTORY
    ${SOURCE_SDK_DIRECTORY_UTILS}/vvis
)

set(VVIS_SOURCE_FILES
    ${VVIS_SOURCE_DIRECTORY}/flow.cpp
    ${VVIS_SOURCE_DIRECTORY}/mpivis.cpp
    ${VVIS_SOURCE_DIRECTORY}/vvis.cpp
    ${VVIS_SOURCE_DIRECTORY}/WaterDist.cpp
)

set(VVIS_HEADER_FILES
    ${VVIS_SOURCE_DIRECTORY}/mpivis.h
    ${VVIS_SOURCE_DIRECTORY}/vis.h
)


set(VVIS_COMMON_INCLUDE_FILES
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/bsplib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/bsplib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/threads.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/threads.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/tools_minidump.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/tools_minidump.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/mpi_stats.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/mpi_stats.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/MySqlDatabase.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/MySqlDatabase.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scratchpad_helpers.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scratchpad_helpers.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/vmpi_tools_shared.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/vmpi_tools_shared.h
    
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/collisionutils.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/collisionutils.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_helpers.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_helpers.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_init.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/filesystem_init.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/scratchpad3d.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/iscratchpad3d.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/loadcmdline.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/loadcmdline.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/lumpfiles.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/lumpfiles.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/zip_utils.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/zip_utils.h
)

add_library(${PROJECT_NAME} SHARED 
    ${VVIS_SOURCE_FILES} 
    ${VVIS_HEADER_FILES}
    ${VVIS_COMMON_INCLUDE_FILES}
)

SOURCE_DLL_BASE_APPLY_PROPERTIES(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PRIVATE 
    ${SOURCE_SDK_DIRECTORY_UTILS}
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}
    ${SOURCE_SDK_DIRECTORY_UTILS}/vmpi
)

target_compile_definitions(${PROJECT_NAME} PRIVATE
    MPI=1
    PROTECTED_THINGS_DISABLE=1
)

target_link_libraries(${PROJECT_NAME} PRIVATE mathlib::mathlib tier0::tier0 tier1::tier1 tier2::tier2 vmpi::vmpi vstdlib::vstdlib)

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} PRIVATE ws2_32.lib)
endif()
