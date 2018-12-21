name :
	 Transmission
homepage :
	 https://www.transmissionbt.com/
url :
	 https://github.com/transmission/transmission-releases/raw/dc77bea/transmission-2.94.tar.xz
description :
	 Lightweight BitTorrent client
build_deps :
	 pkg-config
link_deps :
	 libevent
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-framework Foundation -prebind"
	 ENV.append "LDFLAGS", "-liconv"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-mac
	 --disable-nls
	 --without-gtk
	 ]
	 system "./configure", *args
	 system "make", "install"
	 (var/"transmission").mkpath
