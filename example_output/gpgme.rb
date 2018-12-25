name :
	 Gpgme
homepage :
	 https://www.gnupg.org/related_software/gpgme/
url :
	 https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.12.0.tar.bz2
description :
	 Library access to GnuPG
build_deps :
	 swig
link_deps :
	 gnupg
	 libassuan
	 libgpg-error
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-static"
	 system "make"
	 system "make", "install"
	 inreplace bin/"gpgme-config", prefix, opt_prefix
