if (NOT CMX_INCLUDED)
	include(FetchContent)

	include(cmx-infer-version)
	include(cmx-platform)
	include(cmx-scripts)

	include(cmx-sdl2)
	include(cmx-sdl2-image)
	include(cmx-sdl2-mixer)
	include(cmx-sdl2-net)
	include(cmx-sdl2-rtf)
	include(cmx-sdl2-ttf)

	include(cmx-kstd-core)
	include(cmx-kstd-reflect)
	include(cmx-kstd-platform)
	include(cmx-kstd-streams)
	include(cmx-kstd-io)
	include(cmx-kstd-resource)

	include(cmx-google-test)
	include(cmx-fmt)
	include(cmx-marl)
	include(cmx-dawn)
	include(cmx-atomic-queue)
	include(cmx-parallel-hashmap)
	include(cmx-zlib)
	
	include(cmx-application)
	include(cmx-library)

	set(CMX_INCLUDED ON)
endif()
