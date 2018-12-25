name :
	 Fwknop
homepage :
	 https://www.cipherdyne.org/fwknop/
url :
	 https://github.com/mrash/fwknop/archive/2.6.10.tar.gz
description :
	 Single Packet Authorization and Port Knocking
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 gpgme
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking", "--disable-silent-rules",
	 "--prefix=#{prefix}", "--with-gpgme", "--sysconfdir=#{etc}",
	 "--with-gpg=#{Formula["gnupg"].opt_bin}/gpg"
	 system "make", "install"
