name :
	 Sile
homepage :
	 http://www.sile-typesetter.org/
url :
	 https://github.com/simoncozens/sile.git
description :
	 Modern typesetting system inspired by TeX
build_deps :
	 autoconf
	 automake
	 libtool
	 luarocks
	 pkg-config
link_deps :
	 fontconfig
	 harfbuzz
	 icu4c
	 libpng
	 lua
conflicts :
patches :
EOF_patch :
install :
	 luapath = libexec/"vendor"
	 ENV["LUA_PATH"] = "#{luapath}/share/lua/5.3/?.lua;;#{luapath}/share/lua/5.3/lxp/?.lua"
	 ENV["LUA_CPATH"] = "#{luapath}/lib/lua/5.3/?.so"
	 resources.each do |r|
	 r.stage do
	 if r.name == "lua-zlib"
	 mv "lua-zlib-1.1-0.rockspec", "lua-zlib-1.2-0.rockspec"
	 system "luarocks", "make", "#{r.name}-#{r.version}-0.rockspec", "--tree=#{luapath}"
	 else
	 system "luarocks", "build", r.name, "--tree=#{luapath}"
	 end
	 end
