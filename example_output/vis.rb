name :
	 Vis
homepage :
	 https://github.com/martanne/vis
url :
	 https://github.com/martanne/vis/archive/v0.5.tar.gz
description :
	 Vim-like text editor
build_deps :
	 luarocks
	 pkg-config
link_deps :
	 libtermkey
	 lua
conflicts :
patches :
EOF_patch :
install :
	 luapath = libexec/"vendor"
	 ENV["LUA_PATH"] = "#{luapath}/share/lua/5.3/?.lua"
	 ENV["LUA_CPATH"] = "#{luapath}/lib/lua/5.3/?.so"
	 resource("lpeg").stage do
	 system "luarocks", "build", "lpeg", "--tree=#{luapath}"
