option(SOURCE_BASE_SOURCE_SDK_TOGGLE "Original VPC SOURCESDK variable replacement." true)
option(SOURCE_BASE_STAGING_ONLY "Enable this staging only branch" OFF)
option(SOURCE_BASE_TF_ONLY "Enable this team-fortress only branch" OFF)

function(SOURCE_BASE_APPLY_PROPERTIES ${APPLY_NAME})
    target_compile_definitions(${APPLY_NAME} PRIVATE CMAKE=1)

    if(SOURCE_BASE_STAGING_ONLY EQUAL ON)
        target_compile_definitions(${APPLY_NAME} PRIVATE STAGING_ONLY=1)
    endif(SOURCE_BASE_STAGING_ONLY EQUAL ON)

    if(SOURCE_BASE_SOURCE_SDK_TOGGLE EQUAL ON)
        target_compile_definitions(${APPLY_NAME} PRIVATE RAD_TELEMETRY_DISABLED=1)
    endif(SOURCE_BASE_SOURCE_SDK_TOGGLE EQUAL ON)
endfunction()
