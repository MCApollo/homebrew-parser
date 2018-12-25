name :
	 Libmpd
homepage :
	 https://gmpc.wikia.com/wiki/Gnome_Music_Player_Client
url :
	 https://www.musicpd.org/download/libmpd/11.8.17/libmpd-11.8.17.tar.gz
description :
	 Higher level access to MPD functions
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
