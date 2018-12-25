name :
	 Varnish
homepage :
	 https://www.varnish-cache.org/
url :
	 https://varnish-cache.org/_downloads/varnish-6.1.0.tgz
description :
	 High-performance HTTP accelerator
build_deps :
	 docutils
	 pkg-config
	 sphinx-doc
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
