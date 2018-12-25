name :
	 Isync
homepage :
	 https://isync.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/isync/isync/1.3.0/isync-1.3.0.tar.gz
description :
	 Synchronize a maildir with an IMAP server
build_deps :
link_deps :
	 openssl
optional_deps :
	 berkeley-db
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-silent-rules
	 ]
	 args << "ac_cv_berkdb4=no" if build.without? "berkeley-db"
	 system "./configure", *args
	 system "make", "install"
