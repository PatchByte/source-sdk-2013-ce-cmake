project("height2normal")

include(${SOURCE_SDK_DIRECTORY_CMAKE}/source_exe_base.cmake)

add_executable(${PROJECT_NAME} height2normal.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE tier2::tier2 mathlib::mathlib bitmap::bitmap)

SOURCE_EXE_BASE_APPLY_PROPERTIES(${PROJECT_NAME})
