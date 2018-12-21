name :
	 Xhyve
homepage :
	 https://github.com/machyve/xhyve
url :
	 https://github.com/machyve/xhyve/archive/v0.2.0.tar.gz
description :
	 Lightweight macOS virtualization solution based on FreeBSD's bhyve
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 args = []
	 args << "GIT_VERSION=#{version}" if build.stable?
	 system "make", *args
	 bin.install "build/xhyve"
	 pkgshare.install "test/"
	 pkgshare.install "xhyverun.sh"
	 man1.install "xhyve.1" if build.head?
