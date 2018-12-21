name :
	 KnotResolver
homepage :
	 https://www.knot-resolver.cz
url :
	 https://secure.nic.cz/files/knot-resolver/knot-resolver-3.1.0.tar.xz
description :
	 Minimalistic, caching, DNSSEC-validating DNS resolver
build_deps :
	 cmocka
	 pkg-config
link_deps :
	 gnutls
	 knot
	 libuv
	 lmdb
	 luajit
	 nettle
conflicts :
patches :
EOF_patch :
install :
	 cp "etc/root.hints", buildpath
	 (etc/"kresd").install "root.hints"
	 %w[all lib-install daemon-install client-install modules-install
	 check].each do |target|
	 system "make", target, "PREFIX=#{prefix}", "ETCDIR=#{etc}/kresd"
