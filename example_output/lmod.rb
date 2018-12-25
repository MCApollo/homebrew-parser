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
optional_deps :
conflicts :
resource :
	 ['luafilesystem', 'luaposix']
	 ['https://github.com/keplerproject/luafilesystem/archive/v1_7_0_2.tar.gz', 'https://github.com/luaposix/luaposix/archive/v34.0.4.tar.gz']
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
	 end
	 end
	 system "./configure", "--with-siteControlPrefix=yes", "--prefix=#{prefix}"
	 system "make", "install"
