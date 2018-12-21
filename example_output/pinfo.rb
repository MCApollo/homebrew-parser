name :
	 Pinfo
homepage :
	 https://packages.debian.org/sid/pinfo
url :
	 https://mirrorservice.org/sites/distfiles.macports.org/pinfo/pinfo-0.6.10.tar.bz2
description :
	 User-friendly, console-based viewer for Info documents
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "--force", "--install"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
