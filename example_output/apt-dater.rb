name :
	 AptDater
homepage :
	 https://github.com/DE-IBH/apt-dater
url :
	 https://github.com/DE-IBH/apt-dater/archive/v0.9.0.tar.gz
description :
	 Manage package updates on remote hosts using SSH
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 popt
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "AM_LDFLAGS=", "install"
