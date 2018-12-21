name :
	 LibgpgError
homepage :
	 https://www.gnupg.org/related_software/libgpg-error/
url :
	 https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.33.tar.bz2
description :
	 Common error values for all GnuPG components
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-static"
	 system "make", "install"
	 inreplace bin/"gpg-error-config", prefix, opt_prefix
