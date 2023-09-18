if(NOT CMX_FREESTANDING_INCLUDED)
	macro(target_set_freestanding target access)
		if(DEFINED CMX_PLATFORM_WINDOWS AND DEFINED CMX_COMPILER_MSVC)
			message(FATAL_ERROR "Windows does not support a freestanding compilation target")
		endif()
		target_compile_options(${target} ${access}
			-fshort-wchar
			-ffreestanding
			-fPIC
			-fno-stack-protector
			-mno-red-zone)
		target_link_options(${target} ${access}
			-nostdlib
			-Wl,-Bsymbolic)
		if(DEFINED CMX_COMPILER_GCC)
			target_link_options(${target} ${access}
				-znocombreloc)
		endif()
	endmacro()
	set(CMX_FREESTANDING_INCLUDED ON)
endif()