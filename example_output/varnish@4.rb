name :
	 VarnishAT4
homepage :
	 https://www.varnish-cache.org/
url :
	 https://varnish-cache.org/_downloads/varnish-4.1.10.tgz
description :
	 High-performance HTTP accelerator
build_deps :
	 docutils
	 pkg-config
link_deps :
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}"
	 system "make", "install"
	 (etc/"varnish").install "etc/example.vcl" => "default.vcl"
	 (var/"varnish").mkpath
