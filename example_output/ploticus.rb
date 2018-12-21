name :
	 Ploticus
homepage :
	 https://ploticus.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ploticus/ploticus/2.42/ploticus242_src.tar.gz
description :
	 Scriptable plotting and graphing utility
build_deps :
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 args=["INSTALLBIN=#{bin}",
	 "EXE=ploticus"]
	 inreplace "src/pl.h", /#define\s+PREFABS_DIR\s+""/, "#define PREFABS_DIR \"#{pkgshare}\""
	 system "make", "-C", "src", *args
	 bin.mkdir
	 system "make", "-C", "src", "install", *args
	 pkgshare.install Dir["prefabs/*"]
