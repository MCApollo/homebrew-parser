name :
	 Libgcrypt
homepage :
	 https://gnupg.org/related_software/libgcrypt/
url :
	 https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.4.tar.bz2
description :
	 Cryptographic library based on the code from GnuPG
build_deps :
link_deps :
	 libgpg-error
conflicts :
patches :
EOF_patch :
install :
	 ENV.O1 if DevelopmentTools.clang_build_version == 800
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--enable-static",
	 "--prefix=#{prefix}",
	 "--disable-asm",
	 "--with-libgpg-error-prefix=#{Formula["libgpg-error"].opt_prefix}",
	 "--disable-jent-support"
	 system "make"
	 MachO::Tools.change_install_name("#{buildpath}/tests/.libs/random",
	 "#{lib}/libgcrypt.20.dylib",
	 "#{buildpath}/src/.libs/libgcrypt.20.dylib")
	 system "make", "check"
	 system "make", "install"
	 inreplace bin/"libgcrypt-config", prefix, opt_prefix
