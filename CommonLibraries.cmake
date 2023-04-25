include(IncludeGuard)
include_guard_start(COMMON_LIBS)

include(FetchContent)
include(Platform)
set(CL_DEPS_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps")

# CMake Scripts
set(CL_SCRIPTS_VERSION 23.04)
set(CL_SCRIPTS_FETCHED OFF)

macro(include_scripts)
    if (NOT CL_SCRIPTS_FETCHED)
        FetchContent_Declare(
                cmake_scripts
                GIT_REPOSITORY https://github.com/StableCoder/cmake-scripts.git
                GIT_TAG ${KSTD_SCRIPTS_VERSION})
        FetchContent_Populate(cmake_scripts)

        set(CMAKE_MODULE_PATH "${CL_DEPS_DIR}/cmake_scripts-src;")
        set(ENABLE_ALL_WARNINGS ON)

        include(compiler-options)

        if (NOT COMPILER_MSVC)
            if(${BUILD_DEBUG})
                set(USE_SANITIZER Thread,Undefined)
            else()
                set(USE_SANITIZER "")
            endif()

            include(sanitizers)
        endif ()

        set(CL_SCRIPTS_FETCHED ON)
    endif ()
endmacro()

# SDL (Just macros since we use Find-scripts)
macro(target_include_sdl target)
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake;")
    find_package(SDL2 REQUIRED)
    target_include_directories(${target} PUBLIC ${SDL2_INCLUDE_DIR})
    target_link_libraries(${target} ${SDL2_LIBRARIES})
endmacro()

macro(target_include_sdl_image target)
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake;")
    find_package(SDL2_image REQUIRED)
    target_include_directories(${target} PUBLIC ${SDL2_IMAGE_INCLUDE_DIR})
    target_link_libraries(${target} ${SDL2_IMAGE_LIBRARIES})
endmacro()

macro(target_include_sdl_mixer target)
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake;")
    find_package(SDL2_mixer REQUIRED)
    target_include_directories(${target} PUBLIC ${SDL2_MIXER_INCLUDE_DIR})
    target_link_libraries(${target} ${SDL2_MIXER_LIBRARIES})
endmacro()

macro(target_include_sdl_ttf target)
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake;")
    find_package(SDL2_ttf REQUIRED)
    target_include_directories(${target} PUBLIC ${SDL2_TTF_INCLUDE_DIR})
    target_link_libraries(${target} ${SDL2_TTF_LIBRARIES})
endmacro()

macro(target_include_sdl_net target)
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake;")
    find_package(SDL2_net REQUIRED)
    target_include_directories(${target} PUBLIC ${SDL2_NET_INCLUDE_DIR})
    target_link_libraries(${target} ${SDL2_NET_LIBRARIES})
endmacro()

include_guard_end(COMMON_LIBS)