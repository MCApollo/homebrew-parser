name :
	 StressNg
homepage :
	 https://kernel.ubuntu.com/~cking/stress-ng/
url :
	 https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.09.11.tar.xz
description :
	 Stress test a computer system in various selectable ways
build_deps :
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile", "/usr", prefix
	 system "make"
	 system "make", "install"
