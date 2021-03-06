message ("Loaded: Generic-chc12.cmake")

GET_FILENAME_COMPONENT(CHC12_PATH ${CMAKE_C_COMPILER} PATH)

set (CMAKE_OBJCOPY      FALSE)
set (CMAKE_OBJDUMP      FALSE)

set (CHC12_PIPER       "${CHC12_PATH}/piper.exe"    CACHE FILEPATH "Path to piper")
set (CHC12_BURNER      "${CHC12_PATH}/burner.exe"   CACHE FILEPATH "Path to burner")
set (CMAKE_AR          "${CHC12_PATH}/libmaker.exe" CACHE FILEPATH "Path to archiver" FORCE)
set (CMAKE_LINKER      "${CHC12_PATH}/linker.exe"   CACHE FILEPATH "Path to linker"   FORCE)

# We have to setup the object type very early, as this can't be overridden later on.
#
set (CMAKE_C_OUTPUT_EXTENSION     ".obj"         CACHE STRING "C compiler object extension.")
set (CMAKE_CXX_OUTPUT_EXTENSION   ".obj"         CACHE STRING "C++ compiler object extension.")

#
# Convince CMake we know our compiler works OK.
# If we don't do this it will do a TRY-COMPILE which will fail to link.
#
set (CMAKE_C_COMPILER_ID_RUN    TRUE)
set (CMAKE_C_COMPILER_WORKS     TRUE)
set (CMAKE_CXX_COMPILER_ID_RUN  TRUE)
set (CMAKE_CXX_COMPILER_WORKS   TRUE)

set (CMAKE_C_COMPILER_ID        chc12)
set (CMAKE_CXX_COMPILER_ID      chc12)

#
# Don't generate preprocessed or assembler makefile rules for C/C++ source files.
#
set (CMAKE_SKIP_PREPROCESSED_SOURCE_RULES    TRUE)
set (CMAKE_SKIP_ASSEMBLY_SOURCE_RULES        TRUE)

#
# Workaround to inhibit CMake from performing a TRY-COMPILE to determine the size of "void *",
# this size isn't ever used so its actual value doesn't matter.
#
set (CMAKE_SIZEOF_VOID_P 2)

set (CMAKE_C_ABI_COMPILED    TRUE)
set (CMAKE_C_SIZEOF_DATA_PTR 2)

set (CMAKE_CXX_ABI_COMPILED    TRUE)
set (CMAKE_CXX_SIZEOF_DATA_PTR 2)

#
# Library and linker extensions. (Object extensions have to be specified earlier in Toolchain-Freescale-HC12.cmake)
#
set (CMAKE_FIND_LIBRARY_PREFIXES                     "")
set (CMAKE_FIND_LIBRARY_SUFFIXES                     ".lib")
set (CMAKE_STATIC_LIBRARY_PREFIX                     "")
set (CMAKE_STATIC_LIBRARY_SUFFIX                     ".lib")
set (CMAKE_LINK_LIBRARY_SUFFIX                        ".lib")
set (CMAKE_EXECUTABLE_SUFFIX                         ".abs")

#
# Default options applied to all tool invocations
#
set (CHC12_STANDARD_FLAGS "-ViewHidden -NoEnv -NoBeep -WStdoutOn -WmsgNu=abcde")

#
# C compiler.
#
set (CMAKE_C_FLAGS_INIT                             "${CMAKE_C_FLAGS_INIT} -Cc -I.")
set (CMAKE_C_FLAGS_DEBUG_INIT                       "${CMAKE_C_FLAGS_DEBUG_INIT}")
set (CMAKE_C_FLAGS_MINSIZEREL_INIT                  "${CMAKE_C_FLAGS_MINSIZEREL_INIT} -Os")
set (CMAKE_C_FLAGS_RELEASE_INIT                     "${CMAKE_C_FLAGS_RELEASE_INIT} -Ot")
set (CMAKE_C_FLAGS_RELWITHDEBINFO_INIT              "${CMAKE_C_FLAGS_RELWITHDEBINFO_INIT}")
set (CMAKE_C_STANDARD_LIBRARIES_INIT                "${CMAKE_C_STANDARD_LIBRARIES_INIT}")

#
# C++ compiler
#
set (CMAKE_CXX_FLAGS_INIT                           "${CMAKE_CXX_FLAGS_INIT} -Cc -I.")
set (CMAKE_CXX_FLAGS_DEBUG_INIT                     "${CMAKE_CXX_FLAGS_DEBUG_INIT}")
set (CMAKE_CXX_FLAGS_MINSIZEREL_INIT                "${CMAKE_CXX_FLAGS_MINSIZEREL_INIT} -Os")
set (CMAKE_CXX_FLAGS_RELEASE_INIT                   "${CMAKE_CXX_FLAGS_RELEASE_INIT} -Ot")
set (CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT            "${CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT}")
set (CMAKE_CXX_STANDARD_LIBRARIES_INIT              "${CMAKE_CXX_STANDARD_LIBRARIES_INIT}")

#
# Flags used by the linker.
#
set (CMAKE_EXE_LINKER_FLAGS_INIT                    "${CMAKE_EXE_LINKER_FLAGS_INIT}")
set (CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT              "${CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT}")
set (CMAKE_EXE_LINKER_FLAGS_MINSIZEREL_INIT         "${CMAKE_EXE_LINKER_FLAGS_MINSIZEREL_INIT}")
set (CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT            "${CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT}")
set (CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO          "${CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO}")

set (CMAKE_MODULE_LINKER_FLAGS_INIT                 "${CMAKE_MODULE_LINKER_FLAGS_INIT}")
set (CMAKE_MODULE_LINKER_FLAGS_DEBUG_INIT           "${CMAKE_MODULE_LINKER_FLAGS_DEBUG_INIT}")
set (CMAKE_MODULE_LINKER_FLAGS_MINSIZEREL_INIT      "${CMAKE_MODULE_LINKER_FLAGS_MINSIZEREL_INIT}")
set (CMAKE_MODULE_LINKER_FLAGS_RELEASE_INIT         "${CMAKE_MODULE_LINKER_FLAGS_RELEASE_INIT}")
set (CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO_INIT  "${CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO_INIT}")

set (CMAKE_SHARED_LINKER_FLAGS_INIT                 "${CMAKE_SHARED_LINKER_FLAGS_INIT}")
set (CMAKE_SHARED_LINKER_FLAGS_DEBUG_INIT           "${CMAKE_SHARED_LINKER_FLAGS_DEBUG_INIT}")
set (CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL_INIT      "${CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL_INIT}")
set (CMAKE_SHARED_LINKER_FLAGS_RELEASE_INIT         "${CMAKE_SHARED_LINKER_FLAGS_RELEASE_INIT}")
set (CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO_INIT  "${CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO_INIT}")

#
# Compiler invocation.
#
set (CMAKE_INCLUDE_SYSTEM_FLAG_C         "-EnvLIBPATH=")
set (CMAKE_INCLUDE_SYSTEM_FLAG_CXX       "-EnvLIBPATH=")

set (CMAKE_C_COMPILE_OBJECT              "<CMAKE_C_COMPILER>   ${CHC12_STANDARD_FLAGS} <DEFINES> <FLAGS> -ObjN=<OBJECT> -Lasm=<OBJECT>.lst -Lp=<OBJECT>.i <SOURCE>")
set (CMAKE_CXX_COMPILE_OBJECT            "<CMAKE_CXX_COMPILER> ${CHC12_STANDARD_FLAGS} <DEFINES> <FLAGS> -ObjN=<OBJECT> -Lasm=<OBJECT>.lst -Lp=<OBJECT>.i <SOURCE>")

set(CMAKE_C_CREATE_PREPROCESSED_SOURCE   "<CMAKE_C_COMPILER>   ${CHC12_STANDARD_FLAGS} <DEFINES> <FLAGS> -LpX -Lp=<PREPROCESSED_SOURCE> <SOURCE>")
set(CMAKE_CXX_CREATE_PREPROCESSED_SOURCE "<CMAKE_CXX_COMPILER> ${CHC12_STANDARD_FLAGS} <DEFINES> <FLAGS> -LpX -Lp=<PREPROCESSED_SOURCE> <SOURCE>")

#
# Librarian invocation.
#
set (CMAKE_C_CREATE_STATIC_LIBRARY       "<CMAKE_AR> ${CHC12_STANDARD_FLAGS} -Mar{<TARGET> <OBJECTS>}")
set (CMAKE_CXX_CREATE_STATIC_LIBRARY     "${CMAKE_C_CREATE_STATIC_LIBRARY}")

#
# Link support.
#
set (CMAKE_LIBRARY_PATH_FLAG "-L")
set (CMAKE_LINK_LIBRARY_FLAG "-Add")

#
# Link invocation.
#
set (CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> ${CHC12_STANDARD_FLAGS} -Add{<OBJECTS>} <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <LINK_LIBRARIES> -O<TARGET>")
