name :
	 Npth
homepage :
	 https://gnupg.org/
url :
	 https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2
description :
	 New GNU portable threads library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
