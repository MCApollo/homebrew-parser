name :
	 Libidn
homepage :
	 https://www.gnu.org/software/libidn/
url :
	 https://ftp.gnu.org/gnu/libidn/libidn-1.35.tar.gz
description :
	 International domain name library
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-csharp",
	 "--with-lispdir=#{elisp}"
	 system "make", "install"
