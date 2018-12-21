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
conflicts :
patches :
EOF_patch :
install :
	 resources.each do |r|
	 r.stage(buildpath/"deps-build/build/src/#{r.name}")
