name :
	 Bmake
homepage :
	 http://www.crufty.net/help/sjg/bmake.html
url :
	 http://www.crufty.net/ftp/pub/sjg/bmake-20180919.tar.gz
description :
	 Portable version of NetBSD make(1)
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
	 inreplace "mk/man.mk", "MANTARGET?", "MANTARGET"
	 args = ["--prefix=#{prefix}", "-DWITHOUT_PROG_LINK", "--install"]
	 system "sh", "boot-strap", *args
	 man1.install "bmake.1"
