project("vbsp")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_dll_base.cmake)

set(VBSP_SOURCE_DIRECTORY
    ${SOURCE_SDK_DIRECTORY_UTILS}/vbsp
)

file(GLOB VBSP_SOURCE_FILES 
    ${VBSP_SOURCE_DIRECTORY}/*.cpp
    ${VBSP_SOURCE_DIRECTORY}/*.h
)

set(VRAD_INCLUDE_FILES
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/bsplib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/bsplib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/cmdlib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/pacifier.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/polylib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/polylib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/physdll.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/physdll.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scriplib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/filesystem_tools.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/threads.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/threads.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/tools_minidump.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/tools_minidump.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/map_shared.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/map_shared.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/mpi_stats.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/mpi_stats.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/MySqlDatabase.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/MySqlDatabase.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scratchpad_helpers.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/scratchpad_helpers.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/vmpi_tools_shared.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/vmpi_tools_shared.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/utilmatlib.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/utilmatlib.h
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/mstristrip.cpp
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}/mstristrip.h
    
    
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/builddisp.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/builddisp.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/bsptreedata.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/bsptreedata.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/collisionutils.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/collisionutils.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/chunkfile.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/chunkfile.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/disp_common.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/disp_common.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/dispcoll_common.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/dispcoll_common.h
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/disp_powerinfo.cpp
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/disp_powerinfo.h
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

add_executable(${PROJECT_NAME} 
    ${VBSP_SOURCE_FILES}
    ${VRAD_INCLUDE_FILES}
)

target_include_directories(${PROJECT_NAME} PRIVATE 
    ${SOURCE_SDK_DIRECTORY_UTILS}
    ${SOURCE_SDK_DIRECTORY_UTILS_COMMON}
    ${SOURCE_SDK_DIRECTORY_UTILS}/vmpi
)

SOURCE_DLL_BASE_APPLY_PROPERTIES(${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} PRIVATE 
    tier0::tier0
    tier1::tier1
    tier2::tier2
    bitmap::bitmap
    mathlib::mathlib
    fgdlib::fgdlib
    vtf::vtf
    vstdlib::vstdlib
    vmpi::vmpi
)

target_compile_definitions(${PROJECT_NAME} PRIVATE
    MACRO_MATHLIB=1
    PROTECTED_THINGS_DISABLE=1
)

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} PRIVATE ws2_32.lib)
endif()
