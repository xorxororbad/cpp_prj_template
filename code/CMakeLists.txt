cmake_minimum_required(VERSION 4.3.1)
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "451f2fe2-a8a2-47c3-bc32-94786d8fc91b")

project(cpp_prj_template LANGUAGES CXX 
                         VERSION 0.1.0
)

set(CMAKE_CXX_MODULE_STD 1)
set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_BUILD_TYPE Debug)

add_compile_options(-fPIC)

set(CMAKE_INSTALL_PREFIX 
    "${CMAKE_SOURCE_DIR}/.deploy/"
    CACHE PATH "Default deployment directory prefix for the project." FORCE
)
set(CMAKE_INSTALL_BINDIR
    "./bin" 
    CACHE STRING "Default deployment directory for binaries." FORCE
)
set(CMAKE_INSTALL_LIBDIR
    "./lib" 
    CACHE STRING "Default deployment directory for libraries." FORCE
)
set(CMAKE_INSTALL_INCLUDEDIR
    "./include" 
    CACHE STRING "Default deployment directory for libraries." FORCE
)

set(EXT_DEPLOY_DIR "ext" CACHE STRING "Deployment dir for extensions.")

set(CMAKE_CXX_CLANG_TIDY
    clang-tidy;
    -checks=modernize-*,performance-*;)

set(PRJ_HEADERS_PRIV_PATH ${CMAKE_CURRENT_SOURCE_DIR}/inc/prv/)
set(PRJ_HEADERS_PUB_PATH ${CMAKE_CURRENT_SOURCE_DIR}/inc/)
set(PRJ_SOURCES_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src/)

file(GLOB_RECURSE PRJ_HEADERS_PRIV "${PRJ_HEADERS_PRIV_PATH}/*.h")
file(GLOB_RECURSE PRJ_HEADERS_PUB "${PRJ_HEADERS_PUB_PATH}/*.h")
file(GLOB_RECURSE PRJ_SOURCES "${PRJ_SOURCES_PATH}/*.cpp")
file(GLOB_RECURSE PRJ_MODULE_SOURCES "${PRJ_SOURCES_PATH}/*.cppm")

#add_library(${PROJECT_NAME} SHARED ${PRJ_HEADERS_PUB} ${PRJ_HEADERS_PRIV})

add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
    PUBLIC
    FILE_SET CXX_MODULES FILES
    ${PRJ_MODULE_SOURCES}
    PRIVATE
    ${PRJ_SOURCES}
    PUBLIC
    FILE_SET HEADERS FILES
    ${PRJ_HEADERS_PUB}
    ${PRJ_HEADERS_PRIV}
)

install(TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION "${EXT_DEPLOY_DIR}" 
    ARCHIVE DESTINATION "${EXT_DEPLOY_DIR}"
)

