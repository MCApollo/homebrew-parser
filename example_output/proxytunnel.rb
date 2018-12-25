name :
	 Proxytunnel
homepage :
	 https://github.com/proxytunnel/proxytunnel
url :
	 https://github.com/proxytunnel/proxytunnel/archive/1.9.1.tar.gz
description :
	 Create TCP tunnels through HTTPS proxies
build_deps :
	 asciidoc
	 xmlto
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/proxytunnel/proxytunnel/commit/0cfce96.patch?full_index=1
	 https://github.com/proxytunnel/proxytunnel/pull/27.patch?full_index=1
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "make"
	 system "make", "install", "prefix=#{prefix}"
