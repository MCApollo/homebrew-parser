name :
	 Mawk
homepage :
	 https://invisible-island.net/mawk/
url :
	 https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20171017.tgz
description :
	 Interpreter for the AWK Programming Language
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-silent-rules",
	 "--with-readline=/usr/lib",
	 "--mandir=#{man}"
	 system "make", "install"
