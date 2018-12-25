name :
	 Wget
homepage :
	 https://www.gnu.org/software/wget/
url :
	 https://ftp.gnu.org/gnu/wget/wget-1.20.tar.gz
description :
	 Internet file retriever
build_deps :
	 pkg-config
link_deps :
	 pod2man
	 libidn2
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap", "--skip-po" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--with-ssl=openssl",
	 "--with-libssl-prefix=#{Formula["openssl"].opt_prefix}",
	 "--disable-debug"
	 system "make", "install"
