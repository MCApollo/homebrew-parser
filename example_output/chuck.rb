name :
	 Chuck
homepage :
	 http://chuck.cs.princeton.edu/
url :
	 http://chuck.cs.princeton.edu/release/files/chuck-1.4.0.0.tgz
description :
	 Concurrent, on-the-fly audio programming language
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/core/makefile.x/makefile.osx",
	 "10\\.(6|7|8|9|10|11|12|13)",
	 "10\\.(6|7|8|9|10|11|12|1[0-9])"
	 system "make", "-C", "src", "osx"
	 bin.install "src/chuck"
	 pkgshare.install "examples"
