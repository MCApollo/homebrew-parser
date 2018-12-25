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
optional_deps :
conflicts :
resource :
	 ['lpeg']
	 ['https://luarocks.org/manifests/gvvaughan/lpeg-1.0.1-1.src.rock']
patches :
EOF_patch :
install :
	 luapath = libexec/"vendor"
	 ENV["LUA_PATH"] = "#{luapath}/share/lua/5.3/?.lua"
	 ENV["LUA_CPATH"] = "#{luapath}/lib/lua/5.3/?.so"
	 resource("lpeg").stage do
	 system "luarocks", "build", "lpeg", "--tree=#{luapath}"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 env = { :LUA_PATH => ENV["LUA_PATH"], :LUA_CPATH => ENV["LUA_CPATH"] }
	 bin.env_script_all_files(libexec/"bin", env)
	 mv bin/"vis", bin/"vise"
	 mv man1/"vis.1", man1/"vise.1"
