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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cp "etc/root.hints", buildpath
	 (etc/"kresd").install "root.hints"
	 %w[all lib-install daemon-install client-install modules-install
	 check].each do |target|
	 system "make", target, "PREFIX=#{prefix}", "ETCDIR=#{etc}/kresd"
	 end
	 cp "etc/config.personal", "config"
	 inreplace "config", /^\s*user\(/, "-- user("
	 (etc/"kresd").install "config"
	 (etc/"kresd").install "etc/root.hints"
	 (etc/"kresd").install "etc/icann-ca.pem"
	 (buildpath/"root.keys").write(root_keys)
	 (var/"kresd").install "root.keys"
