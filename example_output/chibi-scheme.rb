name :
	 ChibiScheme
homepage :
	 http://synthcode.com/wiki/chibi-scheme
url :
	 http://synthcode.com/scheme/chibi/chibi-scheme-0.8.0.tgz
description :
	 Small footprint Scheme for use as a C Extension Language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
