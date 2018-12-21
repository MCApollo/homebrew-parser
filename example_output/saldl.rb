name :
	 Saldl
homepage :
	 https://saldl.github.io/
url :
	 https://github.com/saldl/saldl/archive/v40.tar.gz
description :
	 CLI downloader optimized for speed and early preview
build_deps :
	 asciidoc
	 docbook-xsl
	 pkg-config
link_deps :
	 curl
	 libevent
conflicts :
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 args = ["--prefix=#{prefix}"]
	 args << "--saldl-version=v#{version}" unless build.head?
	 system "./waf", "configure", *args
	 system "./waf", "build"
	 system "./waf", "install"
