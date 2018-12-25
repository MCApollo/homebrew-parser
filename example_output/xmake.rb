name :
	 Xmake
homepage :
	 https://xmake.io/
url :
	 https://github.com/tboox/xmake/archive/v2.2.3.tar.gz
description :
	 Make-like build utility based on Lua
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./install", "output"
	 pkgshare.install Dir["xmake/*"]
	 bin.install "output/share/xmake/xmake"
	 bin.env_script_all_files(libexec, :XMAKE_PROGRAM_DIR => pkgshare)
