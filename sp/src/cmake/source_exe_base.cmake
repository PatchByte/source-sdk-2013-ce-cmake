include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_base.cmake)

function(SOURCE_EXE_BASE_APPLY_PROPERTIES APPLY_NAME)
    SOURCE_BASE_APPLY_PROPERTIES(${APPLY_NAME})

    if(NOT SOURCE_BASE_ENABLE_PUBLISH_MODE)
        target_compile_definitions(${APPLY_NAME} PRIVATE DEV_BUILD=1)
    endif()

    if(SOURCE_BASE_ENABLE_PROFILE_MODE AND NOT SOURCE_BASE_ENABLE_RETAIL_MODE)
        target_compile_definitions(${APPLY_NAME} PRIVATE _PROFILE=1)
    endif()

    if(SOURCE_BASE_ENABLE_RETAIL_MODE AND SOURCE_BASE_ENABLE_RETAIL_ASSERTS)
        target_compile_definitions(${APPLY_NAME} PRIVATE RETAIL_ASSERTS=1)
    endif()

    target_compile_definitions(${APPLY_NAME} PRIVATE FRAME_POINTER_OMISSION_DISABLED=1)

    target_include_directories(${APPLY_NAME} PRIVATE
        ${SOURCE_SDK_DIRECTORY_BASE}/common
        ${SOURCE_SDK_DIRECTORY_BASE}/public
        ${SOURCE_SDK_DIRECTORY_PUBLIC}/tier0
        ${SOURCE_SDK_DIRECTORY_PUBLIC}/tier1
    )

    if(SOURCE_SDK_IS_WINDOWS)
        target_compile_options(${APPLY_NAME} PRIVATE
            /Zc:wchar_t
            /Zc:strictStrings-
            /Oi
            /W4
            /NXCOMPAT
        )

        target_link_options(${APPLY_NAME} PRIVATE
            /FORCE:MULTIPLE
            /NODEFAULTLIB:LIBC
            /NODEFAULTLIB:LIBCMT
            /NODEFAULTLIB:LIBCMTD
        )
    
        # @note @todo @patchbyte unify

        target_compile_definitions(${APPLY_NAME} PRIVATE
            WIN32=1
            _WIN32=1
            NDEBUG=1
            _WINDOWS=1
            EXENAME=${PROJECT_NAME}
            _CRT_SECURE_NO_DEPRECATE
            _CRT_NONSTDC_NO_DEPRECATE
            _ALLOW_RUNTIME_LIBRARY_MISMATCH
            _ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH
            _ALLOW_MSC_VER_MISMATCH
        )

        if(SOURCE_BASE_ENABLE_RELEASE_ASSETS)
            target_compile_definitions(${APPLY_NAME} PRIVATE RELEASEASSERTS)
        endif()

        target_link_libraries(${PROJECT_NAME} PRIVATE shell32.lib user32.lib advapi32.lib gdi32.lib comdlg32.lib ole32.lib)

        set_property(TARGET ${APPLY_NAME} PROPERTY CXX_STANDARD 17)
    endif()

    target_link_libraries(${PROJECT_NAME} PRIVATE tier0::tier0 tier1::tier1 vstdlib::vstdlib)
endfunction()
