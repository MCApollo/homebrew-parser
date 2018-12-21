name :
	 WithReadline
homepage :
	 https://www.greenend.org.uk/rjk/sw/withreadline.html
url :
	 https://www.greenend.org.uk/rjk/sw/with-readline-0.1.1.tar.gz
description :
	 Allow GNU Readline to be used with arbitrary programs
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
