name :
	 Mcabber
homepage :
	 https://mcabber.com/
url :
	 https://mcabber.com/files/mcabber-1.1.0.tar.bz2
description :
	 Console Jabber client
build_deps :
	 pkg-config
link_deps :
	 glib
	 gpgme
	 libgcrypt
	 libidn
	 libotr
	 loudmouth
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 cd "mcabber"
	 inreplace "autogen.sh", "libtoolize", "glibtoolize"
	 system "./autogen.sh"
	 end
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-otr"
	 system "make", "install"
	 pkgshare.install %w[mcabberrc.example contrib]
