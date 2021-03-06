name :
	 Neovim
homepage :
	 https://neovim.io/
url :
	 https://github.com/neovim/neovim/archive/v0.3.1.tar.gz
description :
	 Ambitious Vim-fork focused on extensibility and agility
build_deps :
	 cmake
	 lua@5.1
	 luarocks
	 pkg-config
link_deps :
	 gettext
	 jemalloc
	 libtermkey
	 libuv
	 libvterm
	 luajit
	 msgpack
	 unibilium
optional_deps :
conflicts :
resource :
	 ['lpeg', 'mpack', 'inspect', 'luabitop-rockspec', 'luabitop', 'luafilesystem', 'penlight', 'lua_cliargs', 'lua-term', 'luasystem', 'dkjson', 'say', 'luassert', 'mediator_lua', 'busted', 'luacheck', 'luv', 'coxpcall', 'nvim-client']
	 ['https://luarocks.org/manifests/gvvaughan/lpeg-1.0.1-1.src.rock', 'https://github.com/libmpack/libmpack-lua/releases/download/1.0.7/libmpack-lua-1.0.7.tar.gz', 'https://luarocks.org/manifests/kikito/inspect-3.1.1-0.src.rock', 'https://luarocks.org/manifests/luarocks/luabitop-1.0.2-3.rockspec', 'https://github.com/LuaDist/luabitop/archive/1.0.2.tar.gz', 'https://luarocks.org/luafilesystem-1.7.0-2.src.rock', 'https://stevedonovan.github.io/files/penlight-1.5.4.zip', 'https://luarocks.org/lua_cliargs-3.0-1.src.rock', 'https://github.com/hoelzro/lua-term/archive/0.07.tar.gz', 'https://luarocks.org/luasystem-0.2.1-0.src.rock', 'https://luarocks.org/dkjson-2.5-2.src.rock', 'https://github.com/Olivine-Labs/say/archive/v1.3-1.tar.gz', 'https://github.com/Olivine-Labs/luassert/archive/v1.7.10.tar.gz', 'https://github.com/Olivine-Labs/mediator_lua/archive/v1.1.2-0.tar.gz', 'https://github.com/Olivine-Labs/busted/archive/v2.0.rc12-1.tar.gz', 'https://luarocks.org/manifests/mpeterv/luacheck-0.21.2-1.src.rock', 'https://luarocks.org/luv-1.9.1-1.src.rock', 'https://luarocks.org/coxpcall-1.17.0-1.src.rock', 'https://github.com/neovim/lua-client/archive/0.1.0-1.tar.gz']
patches :
EOF_patch :
install :
	 resources.each do |r|
	 r.stage(buildpath/"deps-build/build/src/#{r.name}")
	 end
	 ENV.prepend_path "LUA_PATH", "#{buildpath}/deps-build/share/lua/5.1/?.lua"
	 ENV.prepend_path "LUA_CPATH", "#{buildpath}/deps-build/lib/lua/5.1/?.so"
	 lua_path = "--lua-dir=#{Formula["lua@5.1"].opt_prefix}"
	 cd "deps-build" do
	 cd "build/src/luafilesystem" do
	 output = Utils.popen_read("luarocks", "unpack", lua_path, "luafilesystem-1.7.0-2.src.rock", "--tree=#{buildpath}/deps-build")
	 unpack_dir = output.split("\n")[-2]
	 cd unpack_dir do
	 system "luarocks", "make", lua_path, "--tree=#{buildpath}/deps-build"
	 end
	 end
	 cd "build/src/penlight" do
	 system "luarocks", "make", lua_path, "--tree=#{buildpath}/deps-build"
	 end
	 cp "build/src/luabitop-rockspec/luabitop-1.0.2-3.rockspec", "build/src/luabitop/"
	 cd "build/src/luabitop/" do
	 system "luarocks", "make", lua_path, "--tree=#{buildpath}/deps-build"
	 end
	 %w[
	 lpeg/lpeg-1.0.1-1.src.rock
	 mpack/mpack-1.0.7-0.rockspec
	 inspect/inspect-3.1.1-0.src.rock
	 lua_cliargs/lua_cliargs-3.0-1.src.rock
	 lua-term/lua-term-0.7-1.rockspec
	 luasystem/luasystem-0.2.1-0.src.rock
	 dkjson/dkjson-2.5-2.src.rock
	 say/say-1.3-1.rockspec
	 luassert/luassert-1.7.10-0.rockspec
	 mediator_lua/mediator_lua-1.1.2-0.rockspec
	 busted/busted-2.0.rc12-1.rockspec
	 luacheck/luacheck-0.21.2-1.src.rock
	 luv/luv-1.9.1-1.src.rock
	 coxpcall/coxpcall-1.17.0-1.src.rock
	 nvim-client/nvim-client-0.1.0-1.rockspec
	 ].each do |rock|
	 dir, rock = rock.split("/")
	 cd "build/src/#{dir}" do
	 output = Utils.popen_read("luarocks", "unpack", lua_path, rock, "--tree=#{buildpath}/deps-build")
	 unpack_dir = output.split("\n")[-2]
	 cd unpack_dir do
	 system "luarocks", "make", lua_path, "--tree=#{buildpath}/deps-build"
	 end
	 end
	 end
	 system "cmake", "../third-party", "-DUSE_BUNDLED=OFF", *std_cmake_args
	 system "make"
	 end
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
