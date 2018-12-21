name :
	 Tinyproxy
homepage :
	 https://www.banu.com/tinyproxy/
url :
	 https://github.com/tinyproxy/tinyproxy/releases/download/1.10.0/tinyproxy-1.10.0.tar.xz
description :
	 HTTP/HTTPS proxy for POSIX systems
build_deps :
	 asciidoc
	 docbook-xsl
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --localstatedir=#{var}
	 --sysconfdir=#{etc}
	 --disable-regexcheck
	 --enable-filter
	 --enable-reverse
	 --enable-transparent
	 ]
	 system "./configure", *args
	 system "make", "install"
	 (var/"log/tinyproxy").mkpath
	 (var/"run/tinyproxy").mkpath
