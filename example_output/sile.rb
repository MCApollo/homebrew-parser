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
optional_deps :
conflicts :
resource :
	 ['lpeg', 'lua-zlib', 'luaexpat', 'luafilesystem']
	 ['http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-1.0.1.tar.gz', 'https://github.com/brimworks/lua-zlib/archive/v1.2.tar.gz', 'https://matthewwild.co.uk/projects/luaexpat/luaexpat-1.3.0.tar.gz', 'https://github.com/keplerproject/luafilesystem/archive/v1_7_0_2.tar.gz']
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
	 end
	 system "./bootstrap.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-lua=#{prefix}",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 (libexec/"bin").install bin/"sile"
	 (bin/"sile").write <<~EOS
	 #!/bin/bash
	 export LUA_PATH="#{ENV["LUA_PATH"]}"
	 export LUA_CPATH="#{ENV["LUA_CPATH"]}"
	 "#{libexec}/bin/sile" "$@"
	 EOS
