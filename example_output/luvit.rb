name :
	 Luvit
homepage :
	 https://luvit.io
url :
	 https://github.com/luvit/luvit/archive/2.15.0.tar.gz
description :
	 Asynchronous I/O for Lua
build_deps :
	 pkg-config
link_deps :
	 luajit
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["USE_SYSTEM_SSL"] = "1"
	 ENV["USE_SYSTEM_LUAJIT"] = "1"
	 ENV["PREFIX"] = prefix
	 system "make"
	 system "make", "install"
