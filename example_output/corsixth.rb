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
optional_deps :
conflicts :
resource :
	 ['lpeg', 'luafilesystem']
	 ['https://ftp.openbsd.org/pub/OpenBSD/distfiles/lpeg-1.0.1.tar.gz', 'https://github.com/keplerproject/luafilesystem/archive/v1_7_0_2.tar.gz']
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
	 end
	 end
	 system "cmake", ".", "-DLUA_INCLUDE_DIR=#{Formula["lua"].opt_include}/lua",
	 "-DLUA_LIBRARY=#{Formula["lua"].opt_lib}/liblua.dylib",
	 "-DLUA_PROGRAM_PATH=#{Formula["lua"].opt_bin}/lua",
	 *std_cmake_args
	 system "make"
	 prefix.install "CorsixTH/CorsixTH.app"
	 env = { :LUA_PATH => ENV["LUA_PATH"], :LUA_CPATH => ENV["LUA_CPATH"] }
	 (bin/"CorsixTH").write_env_script(prefix/"CorsixTH.app/Contents/MacOS/CorsixTH", env)
