project "lua"
	language "C"
	kind "StaticLib"
	warnings "off"
	targetdir "bin"

	includedirs { "src" }

	files
	{
		"*.h",
		"*.c"
	}

	excludes
	{
		"lua.c",
		"luac.c",
		"onelua.c"
	}

	-- For POSIX compliant systems
	filter "system:linux or bsd or hurd or aix or solaris or haiku"
		defines     { "LUA_USE_POSIX", "LUA_USE_DLOPEN" }
		links { "m", "dl" }
	
	-- For MACOSX
	filter "system:macosx"
		defines     { "LUA_USE_MACOSX" }
