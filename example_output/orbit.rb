name :
	 Orbit
homepage :
	 https://projects.gnome.org/ORBit2
url :
	 https://download.gnome.org/sources/ORBit2/2.14/ORBit2-2.14.19.tar.bz2
description :
	 CORBA 2.4-compliant object request broker (ORB)
build_deps :
	 pkg-config
link_deps :
	 glib
	 libidl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/6b7eaf2b/orbit/patch-linc2-src-Makefile.in.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/6b7eaf2b/orbit/patch-configure.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
