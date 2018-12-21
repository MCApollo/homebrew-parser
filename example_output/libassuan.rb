name :
	 Libassuan
homepage :
	 https://www.gnupg.org/related_software/libassuan/
url :
	 https://gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.2.tar.bz2
description :
	 Assuan IPC Library
build_deps :
link_deps :
	 libgpg-error
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-static"
	 system "make", "install"
	 inreplace bin/"libassuan-config", prefix, opt_prefix
