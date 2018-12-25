name :
	 Dfix
homepage :
	 https://github.com/dlang-community/dfix
url :
	 https://github.com/dlang-community/dfix.git
description :
	 Auto-upgrade tool for D source code
build_deps :
	 dmd
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
	 system "make", "test"
	 bin.install "bin/dfix"
	 pkgshare.install "test/testfile_expected.d", "test/testfile_master.d"
