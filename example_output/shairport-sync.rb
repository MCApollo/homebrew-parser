name :
	 ShairportSync
homepage :
	 https://github.com/mikebrady/shairport-sync
url :
	 https://github.com/mikebrady/shairport-sync/archive/3.2.2.tar.gz
description :
	 AirTunes emulator that adds multi-room capability
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 libao
	 libconfig
	 libdaemon
	 libsoxr
	 openssl
	 popt
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 args = %W[
	 --with-os=darwin
	 --with-ssl=openssl
	 --with-dns_sd
	 --with-ao
	 --with-stdout
	 --with-pipe
	 --with-soxr
	 --with-metadata
	 --with-piddir=#{var}/run
	 --sysconfdir=#{etc}/shairport-sync
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
	 (var/"run").mkpath
