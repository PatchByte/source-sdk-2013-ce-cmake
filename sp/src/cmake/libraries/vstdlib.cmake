project("vstdlib")

set(VSTDLIB_PUBLIC_DIRECTORY 
    ${SOURCE_SDK_DIRECTORY_PUBLIC}/vstdlib
)

set(VSTDLIB_HEADER_FILES
    ${VSTDLIB_PUBLIC_DIRECTORY}/coroutine.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/cvar.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/IKeyValuesSystem.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/iprocessutils.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/jobthread.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/osversion.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/pch_vstdlib.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/random.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/vcover.h
    ${VSTDLIB_PUBLIC_DIRECTORY}/vstdlib.h
)

set(VSTDLIB_SOURCE_FILES
    ${SOURCE_SDK_DIRECTORY_CMAKE}/utility/external-stub-for-libs.cpp
)

add_library(${PROJECT_NAME} STATIC ${VSTDLIB_HEADER_FILES} ${VSTDLIB_SOURCE_FILES})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

if(SOURCE_SDK_IS_WINDOWS)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/vstdlib.lib)
elseif(SOURCE_SDK_IS_LINUX)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${SOURCE_SDK_DIRECTORY_GAME_LIBRARIES}/linux32/libvstdlib.a)
else()
    message(FATAL_ERROR "Non supported architecture or operating system encounter.")
endif()

SOURCE_LIB_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
