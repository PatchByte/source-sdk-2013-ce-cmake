option(SOURCE_BASE_SOURCE_SDK_TOGGLE "Original VPC SOURCESDK variable replacement." ON)
option(SOURCE_BASE_STAGING_ONLY "Enable this staging only branch" OFF)
option(SOURCE_BASE_TF_ONLY "Enable this team-fortress only branch" OFF)

option(SOURCE_BASE_WIN32_USE_QUICKTIME "Quicktime override (Take a look at source_video_base.vpc L23)" OFF)

option(SOURCE_BASE_ENABLE_PUBLISH_MODE "Enable the publish mode." OFF)
option(SOURCE_BASE_ENABLE_RETAIL_MODE "Enable the retail version." OFF)
option(SOURCE_BASE_ENABLE_RETAIL_ASSERTS "Enable the retail asserts." OFF)
option(SOURCE_BASE_ENABLE_PROFILE_MODE "Enable the profiling mode." OFF)
option(SOURCE_BASE_ENABLE_RELEASE_ASSETS "Enable the release asserts." OFF)

include(CMakeParseArguments)

function(SOURCE_BASE_APPLY_PROPERTIES APPLY_NAME)

    target_compile_definitions(${APPLY_NAME} PRIVATE CMAKE=1)

    if(SOURCE_BASE_STAGING_ONLY)
        target_compile_definitions(${APPLY_NAME} PRIVATE STAGING_ONLY=1)
    endif()

    if(SOURCE_BASE_SOURCE_SDK_TOGGLE)
        target_compile_definitions(${APPLY_NAME} PRIVATE RAD_TELEMETRY_DISABLED=1)
    endif()


    if(SOURCE_SDK_IS_WINDOWS)
        target_compile_definitions(${APPLY_NAME} PRIVATE
            COMPILER_MSVC=1
        )

        if(SOURCE_SDK_IS_WIN32)
            target_compile_options(${APPLY_NAME} PRIVATE /arch:SSE2)
        endif()

        if(NOT SOURCE_BASE_WIN32_USE_QUICKTIME)
            target_compile_definitions(${APPLY_NAME} PRIVATE 
                BIND_VIDEO=1
                AVI_VIDEO=1
                WMV_VIDEO=1
            )
        else()
            target_compile_definitions(${APPLY_NAME} PRIVATE
                AVI_VIDEO=1
                WMV_VIDEO=1
                QUICKTIME_VIDEO=1
            )
        endif()
    endif()

    if(SOURCE_SDK_IS_WIN64)
        target_compile_definitions(${APPLY_NAME} PRIVATE 
            PLATFORM_64BITS=1 
            WIN64=1 
            _WIN64=1 
            COMPILER_MSVC64=1
        )
    elseif(SOURCE_SDK_IS_WIN32)
        target_compile_definitions(${APPLY_NAME} PRIVATE
            COMPILER_MSVC32=1
        )
    endif()
endfunction()
