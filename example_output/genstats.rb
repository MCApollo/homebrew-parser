name :
	 Genstats
homepage :
	 https://www.vanheusden.com/genstats/
url :
	 https://www.vanheusden.com/genstats/genstats-1.2.tgz
description :
	 Generate statistics about stdin or textfiles
build_deps :
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "br.cpp", /if \(_XOPEN_VERSION >= 600\)/,
	 "if (_XOPEN_VERSION >= 600) && !__APPLE__"
	 system "make"
	 bin.install "genstats"
	 man.install "genstats.1"
