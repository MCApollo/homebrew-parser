name :
	 Cattle
homepage :
	 https://github.com/andreabolognani/cattle
url :
	 https://kiyuko.org/software/cattle/releases/cattle-1.2.2.tar.gz
description :
	 Brainfuck language toolkit
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 pkgshare.mkpath
	 cp_r ["examples", "tests"], pkgshare
	 rm Dir["#{pkgshare}/{examples,tests}/{Makefile.am,.gitignore}"]
	 if build.head?
	 inreplace "autogen.sh", "libtoolize", "glibtoolize"
	 system "sh", "autogen.sh"
