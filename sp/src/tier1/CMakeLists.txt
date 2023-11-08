project("tier1")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_lib_base.cmake)

set(TIER1_SOURCE_DIRECTORY ${SOURCE_SDK_DIRECTORY_BASE}/tier1)
set(TIER1_PUBLIC_DIRECTORY ${SOURCE_SDK_DIRECTORY_PUBLIC}/tier1)

set(TIER1_SOURCE_FILES
    ${TIER1_SOURCE_DIRECTORY}/bitbuf.cpp
    ${TIER1_SOURCE_DIRECTORY}/newbitbuf.cpp
    ${TIER1_SOURCE_DIRECTORY}/byteswap.cpp
    ${TIER1_SOURCE_DIRECTORY}/characterset.cpp
    ${TIER1_SOURCE_DIRECTORY}/checksum_crc.cpp
    ${TIER1_SOURCE_DIRECTORY}/checksum_md5.cpp
    ${TIER1_SOURCE_DIRECTORY}/checksum_sha1.cpp
    ${TIER1_SOURCE_DIRECTORY}/commandbuffer.cpp
    ${TIER1_SOURCE_DIRECTORY}/convar.cpp
    ${TIER1_SOURCE_DIRECTORY}/datamanager.cpp
    ${TIER1_SOURCE_DIRECTORY}/diff.cpp
    ${TIER1_SOURCE_DIRECTORY}/generichash.cpp
    ${TIER1_SOURCE_DIRECTORY}/ilocalize.cpp
    ${TIER1_SOURCE_DIRECTORY}/interface.cpp
    ${TIER1_SOURCE_DIRECTORY}/KeyValues.cpp
    ${TIER1_SOURCE_DIRECTORY}/kvpacker.cpp
    ${TIER1_SOURCE_DIRECTORY}/lzmaDecoder.cpp
    ${TIER1_SOURCE_DIRECTORY}/mempool.cpp
    ${TIER1_SOURCE_DIRECTORY}/memstack.cpp
    ${TIER1_SOURCE_DIRECTORY}/NetAdr.cpp
    ${TIER1_SOURCE_DIRECTORY}/splitstring.cpp
    ${TIER1_SOURCE_DIRECTORY}/rangecheckedvar.cpp
    ${TIER1_SOURCE_DIRECTORY}/reliabletimer.cpp
    ${TIER1_SOURCE_DIRECTORY}/stringpool.cpp
    ${TIER1_SOURCE_DIRECTORY}/strtools.cpp
    ${TIER1_SOURCE_DIRECTORY}/strtools_unicode.cpp
    ${TIER1_SOURCE_DIRECTORY}/tier1.cpp
    ${TIER1_SOURCE_DIRECTORY}/tokenreader.cpp
    ${TIER1_SOURCE_DIRECTORY}/sparsematrix.cpp
    ${TIER1_SOURCE_DIRECTORY}/uniqueid.cpp
    ${TIER1_SOURCE_DIRECTORY}/utlbuffer.cpp
    ${TIER1_SOURCE_DIRECTORY}/utlbufferutil.cpp
    ${TIER1_SOURCE_DIRECTORY}/utlstring.cpp
    ${TIER1_SOURCE_DIRECTORY}/utlsymbol.cpp
    "${TIER1_SOURCE_DIRECTORY}/snappy.cpp"
    "${TIER1_SOURCE_DIRECTORY}/snappy-sinksource.cpp"
    "${TIER1_SOURCE_DIRECTORY}/snappy-stubs-internal.cpp"
)

set(TIER1_HEADER_FILES
    "${TIER1_SOURCE_DIRECTORY}/snappy-internal.h"
    "${TIER1_SOURCE_DIRECTORY}/snappy-stubs-internal.h"
)

set(TIER1_PUBLIC_HEADER_FILES
    ${TIER1_PUBLIC_DIRECTORY}/bitbuf.h
    ${TIER1_PUBLIC_DIRECTORY}/byteswap.h
    ${TIER1_PUBLIC_DIRECTORY}/callqueue.h
    ${TIER1_PUBLIC_DIRECTORY}/characterset.h
    ${TIER1_PUBLIC_DIRECTORY}/checksum_crc.h
    ${TIER1_PUBLIC_DIRECTORY}/checksum_md5.h
    ${TIER1_PUBLIC_DIRECTORY}/checksum_sha1.h
    ${TIER1_PUBLIC_DIRECTORY}/CommandBuffer.h
    ${TIER1_PUBLIC_DIRECTORY}/convar.h
    ${TIER1_PUBLIC_DIRECTORY}/datamanager.h
    ${TIER1_PUBLIC_DIRECTORY}/../datamap.h
    ${TIER1_PUBLIC_DIRECTORY}/delegates.h
    ${TIER1_PUBLIC_DIRECTORY}/diff.h
    ${TIER1_PUBLIC_DIRECTORY}/fmtstr.h
    ${TIER1_PUBLIC_DIRECTORY}/functors.h
    ${TIER1_PUBLIC_DIRECTORY}/generichash.h
    ${TIER1_PUBLIC_DIRECTORY}/iconvar.h
    ${TIER1_PUBLIC_DIRECTORY}/ilocalize.h
    ${TIER1_PUBLIC_DIRECTORY}/interface.h
    ${TIER1_PUBLIC_DIRECTORY}/KeyValues.h
    ${TIER1_PUBLIC_DIRECTORY}/kvpacker.h
    ${TIER1_PUBLIC_DIRECTORY}/lzmaDecoder.h
    ${TIER1_PUBLIC_DIRECTORY}/lzss.h
    ${TIER1_PUBLIC_DIRECTORY}/mempool.h
    ${TIER1_PUBLIC_DIRECTORY}/memstack.h
    ${TIER1_PUBLIC_DIRECTORY}/netadr.h
    ${TIER1_PUBLIC_DIRECTORY}/processor_detect.h
    ${TIER1_PUBLIC_DIRECTORY}/rangecheckedvar.h
    ${TIER1_PUBLIC_DIRECTORY}/refcount.h
    ${TIER1_PUBLIC_DIRECTORY}/smartptr.h
    ${TIER1_PUBLIC_DIRECTORY}/snappy.h
    ${TIER1_PUBLIC_DIRECTORY}/snappy-sinksource.h
    ${TIER1_PUBLIC_DIRECTORY}/stringpool.h
    ${TIER1_PUBLIC_DIRECTORY}/strtools.h
    ${TIER1_PUBLIC_DIRECTORY}/tier1.h
    ${TIER1_PUBLIC_DIRECTORY}/tokenreader.h
    ${TIER1_PUBLIC_DIRECTORY}/utlbidirectionalset.h
    ${TIER1_PUBLIC_DIRECTORY}/utlblockmemory.h
    ${TIER1_PUBLIC_DIRECTORY}/utlbuffer.h
    ${TIER1_PUBLIC_DIRECTORY}/utlbufferutil.h
    ${TIER1_PUBLIC_DIRECTORY}/utlcommon.h
    ${TIER1_PUBLIC_DIRECTORY}/utldict.h
    ${TIER1_PUBLIC_DIRECTORY}/utlenvelope.h
    ${TIER1_PUBLIC_DIRECTORY}/utlfixedmemory.h
    ${TIER1_PUBLIC_DIRECTORY}/utlhandletable.h
    ${TIER1_PUBLIC_DIRECTORY}/utlhash.h
    ${TIER1_PUBLIC_DIRECTORY}/utlhashtable.h
    ${TIER1_PUBLIC_DIRECTORY}/utllinkedlist.h
    ${TIER1_PUBLIC_DIRECTORY}/utlmap.h
    ${TIER1_PUBLIC_DIRECTORY}/utlmemory.h
    ${TIER1_PUBLIC_DIRECTORY}/utlmultilist.h
    ${TIER1_PUBLIC_DIRECTORY}/utlpriorityqueue.h
    ${TIER1_PUBLIC_DIRECTORY}/utlqueue.h
    ${TIER1_PUBLIC_DIRECTORY}/utlrbtree.h
    ${TIER1_PUBLIC_DIRECTORY}/UtlSortVector.h
    ${TIER1_PUBLIC_DIRECTORY}/utlstack.h
    ${TIER1_PUBLIC_DIRECTORY}/utlstring.h
    ${TIER1_PUBLIC_DIRECTORY}/UtlStringMap.h
    ${TIER1_PUBLIC_DIRECTORY}/utlsymbol.h
    ${TIER1_PUBLIC_DIRECTORY}/utlsymbollarge.h
    ${TIER1_PUBLIC_DIRECTORY}/utlvector.h
)

if(NOT SOURCE_BASE_SOURCE_SDK_TOGGLE)
    message("WWW lzma.cpp is missing.")
endif()

if(SOURCE_SDK_IS_WINDOWS)
    set(TIER1_SOURCE_FILES
        ${TIER1_SOURCE_FILES}

        ${TIER1_SOURCE_DIRECTORY}/processor_detect.cpp
    )

    set(TIER1_PUBLIC_HEADER_FILES
        ${TIER1_PUBLIC_HEADER_FILES}

        ${TIER1_PUBLIC_DIRECTORY}/uniqueid.h
        ${SOURCE_SDK_DIRECTORY_BASE}/common/xbox/xboxstubs.h
    )
endif()

if(SOURCE_SDK_IS_LINUX)
    set(TIER1_SOURCE_FILES
        ${TIER1_SOURCE_FILES}

        ${TIER1_SOURCE_DIRECTORY}/qsort_s.cpp
        ${TIER1_SOURCE_DIRECTORY}/pathmatch.cpp
    )
endif()

if(SOURCE_SDK_IS_POSIX)
    message("WWW math_proxy.cpp is missing.")

    set(TIER1_SOURCE_FILES
        ${TIER1_SOURCE_FILES}

        ${TIER1_SOURCE_DIRECTORY}/processor_detect_linux.cpp
    )
endif()

add_library(${PROJECT_NAME} STATIC 
    ${TIER1_SOURCE_FILES} 
    ${TIER1_HEADER_FILES} 
    ${TIER1_PUBLIC_HEADER_FILES}
)

add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_compile_definitions(${PROJECT_NAME} PRIVATE TIER1_STATIC_LIB=1)
target_include_directories(${PROJECT_NAME} PUBLIC ${TIER1_PUBLIC_DIRECTORY})

# @todo @note @patchbyte Is this still needed?
target_link_libraries(${PROJECT_NAME} PRIVATE Rpcrt4.lib)

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
