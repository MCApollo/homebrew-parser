name :
	 Lmod
homepage :
	 https://www.tacc.utexas.edu/research-development/tacc-projects/lmod
url :
	 https://github.com/TACC/Lmod/archive/7.8.11.tar.gz
description :
	 Lua-based environment modules system to modify PATH variable
build_deps :
	 luarocks
	 pkg-config
link_deps :
	 lua
conflicts :
patches :
EOF_patch :
install :
	 luapath = libexec/"vendor"
	 ENV["LUA_PATH"] = "?.lua;" \
	 "#{luapath}/share/lua/5.3/?.lua;" \
	 "#{luapath}/share/lua/5.3/?/init.lua"
	 ENV["LUA_CPATH"] = "#{luapath}/lib/lua/5.3/?.so"
	 resources.each do |r|
	 r.stage do
	 system "luarocks", "make", "--tree=#{luapath}"
