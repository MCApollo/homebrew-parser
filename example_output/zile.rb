name :
	 Zile
homepage :
	 https://www.gnu.org/software/zile/
url :
	 https://ftp.gnu.org/gnu/zile/zile-2.4.14.tar.gz
description :
	 Text editor development kit
build_deps :
	 help2man
	 pkg-config
link_deps :
	 bdw-gc
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
