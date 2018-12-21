name :
	 Luarocks
homepage :
	 https://luarocks.org/
url :
	 https://luarocks.org/releases/luarocks-3.0.1.tar.gz
description :
	 Package manager for the Lua programming language
build_deps :
link_deps :
	 lua@5.1
	 lua
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--rocks-tree=#{HOMEBREW_PREFIX}"
	 system "make", "install"
