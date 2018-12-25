name :
	 Lftp
homepage :
	 https://lftp.yar.ru/
url :
	 https://lftp.yar.ru/ftp/lftp-4.8.4.tar.xz
description :
	 Sophisticated file transfer program
build_deps :
link_deps :
	 libidn
	 openssl
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}",
	 "--with-readline=#{Formula["readline"].opt_prefix}",
	 "--with-libidn=#{Formula["libidn"].opt_prefix}"
	 system "make", "install"
