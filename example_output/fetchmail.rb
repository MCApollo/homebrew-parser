name :
	 Fetchmail
homepage :
	 http://www.fetchmail.info/
url :
	 https://downloads.sourceforge.net/project/fetchmail/branch_6.3/fetchmail-6.3.26.tar.xz
description :
	 Fetch mail from a POP, IMAP, ETRN, or ODMR-capable server
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}", "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
