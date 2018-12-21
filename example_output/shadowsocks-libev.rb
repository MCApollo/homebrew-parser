name :
	 ShadowsocksLibev
homepage :
	 https://github.com/shadowsocks/shadowsocks-libev
url :
	 https://github.com/shadowsocks/shadowsocks-libev/releases/download/v3.2.3/shadowsocks-libev-3.2.3.tar.gz
description :
	 Libev port of shadowsocks
build_deps :
	 asciidoc
	 xmlto
link_deps :
	 c-ares
	 libev
	 libsodium
	 mbedtls
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 (buildpath/"shadowsocks-libev.json").write <<~EOS
	 {
	 "server":"localhost",
	 "server_port":8388,
	 "local_port":1080,
	 "password":"barfoo!",
	 "timeout":600,
	 "method":null
	 }
	 EOS
	 etc.install "shadowsocks-libev.json"
	 inreplace Dir["man/*"], "/etc/shadowsocks-libev/config.json", "#{etc}/shadowsocks-libev.json"
	 system "make", "install"
