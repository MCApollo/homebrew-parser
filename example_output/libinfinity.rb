name :
	 Libinfinity
homepage :
	 https://gobby.github.io
url :
	 http://releases.0x539.de/libinfinity/libinfinity-0.6.8.tar.gz
description :
	 GObject-based C implementation of the Infinote protocol
build_deps :
	 pkg-config
link_deps :
	 glib
	 gnutls
	 gsasl
	 gtk+3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/f8e3d2e4/libinfinity/patch-infinoted-infinoted-pam.c.diff
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-gtk3", "--with-inftextgtk", "--with-infgtk"
	 system "make", "install"
