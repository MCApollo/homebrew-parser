name :
	 Tup
homepage :
	 http://gittup.org/tup/
url :
	 https://github.com/gittup/tup/archive/v0.7.8.tar.gz
description :
	 File-based build system
build_deps :
	 pkg-config
link_deps :
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 ENV["TUP_LABEL"] = version
	 system "./build.sh"
	 bin.install "build/tup"
	 man1.install "tup.1"
	 doc.install (buildpath/"docs").children
	 pkgshare.install "contrib/syntax"
