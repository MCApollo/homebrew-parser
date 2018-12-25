name :
	 WaitOn
homepage :
	 https://www.freshports.org/sysutils/wait_on/
url :
	 https://pkg.freebsd.org/ports-distfiles/wait_on-1.1.tar.gz
description :
	 Provides shell scripts with access to kqueue(3)
build_deps :
	 bsdmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "bsdmake"
	 bin.install "wait_on"
	 man1.install "wait_on.1.gz"
