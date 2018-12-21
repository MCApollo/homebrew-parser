name :
	 Mpdscribble
homepage :
	 https://mpd.wikia.com/wiki/Client:Mpdscribble
url :
	 https://www.musicpd.org/download/mpdscribble/0.22/mpdscribble-0.22.tar.gz
description :
	 Last.fm reporting client for mpd
build_deps :
	 pkg-config
link_deps :
	 glib
	 libmpdclient
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
	 system "make", "install"
