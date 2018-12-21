name :
	 Corsixth
homepage :
	 https://github.com/CorsixTH/CorsixTH
url :
	 https://github.com/CorsixTH/CorsixTH/archive/v0.62.tar.gz
description :
	 Open source clone of Theme Hospital
build_deps :
	 cmake
	 luarocks
	 :xcode
link_deps :
	 ffmpeg
	 freetype
	 lua
	 sdl2
	 sdl2_mixer
conflicts :
patches :
EOF_patch :
install :
	 ENV["TARGET_BUILD_DIR"] = "."
	 ENV["FULL_PRODUCT_NAME"] = "CorsixTH.app"
	 luapath = libexec/"vendor"
	 ENV["LUA_PATH"] = "#{luapath}/share/lua/5.3/?.lua"
	 ENV["LUA_CPATH"] = "#{luapath}/lib/lua/5.3/?.so"
	 resources.each do |r|
	 r.stage do
	 system "luarocks", "build", r.name, "--tree=#{luapath}"
