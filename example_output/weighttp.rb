name :
	 Weighttp
homepage :
	 https://redmine.lighttpd.net/projects/weighttp/wiki
url :
	 https://github.com/lighttpd/weighttp/archive/weighttp-0.4.tar.gz
description :
	 Webserver benchmarking tool that supports multithreading
build_deps :
link_deps :
	 libev
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./waf", "configure"
	 system "./waf", "build"
	 bin.install "build/default/weighttp"
