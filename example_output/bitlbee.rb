name :
	 Bitlbee
homepage :
	 https://www.bitlbee.org/
url :
description :
	 IRC to other chat networks gateway
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 gnutls
	 libgcrypt
	 pidgin
conflicts :
patches :
	 https://github.com/bitlbee/bitlbee/commit/eb73d05e.patch?full_index=1
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --plugindir=#{HOMEBREW_PREFIX}/lib/bitlbee/
	 --debug=0
	 --ssl=gnutls
	 --etcdir=#{etc}/bitlbee
	 --pidfile=#{var}/bitlbee/run/bitlbee.pid
	 --config=#{var}/bitlbee/lib/
	 --ipsocket=#{var}/bitlbee/run/bitlbee.sock
	 ]
	 args << "--purple=1" if build.with? "pidgin"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 system "make", "install-dev"
	 system "make", "install-etc"
	 (var/"bitlbee/run").mkpath
	 (var/"bitlbee/lib").mkpath
