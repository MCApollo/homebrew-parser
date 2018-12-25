name :
	 Libksba
homepage :
	 https://www.gnupg.org/related_software/libksba/
url :
	 https://gnupg.org/ftp/gcrypt/libksba/libksba-1.3.5.tar.bz2
description :
	 X.509 and CMS library
build_deps :
link_deps :
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
	 "--prefix=#{prefix}"
	 system "make", "install"
	 inreplace bin/"ksba-config", prefix, opt_prefix
