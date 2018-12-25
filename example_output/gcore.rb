name :
	 Gcore
homepage :
	 https://osxbook.com/book/bonus/chapter8/core/
url :
	 https://osxbook.com/book/bonus/chapter8/core/download/gcore-1.3.tar.gz
description :
	 Produce a snapshot (core dump) of a running process
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
	 system "make"
	 bin.install "gcore"
