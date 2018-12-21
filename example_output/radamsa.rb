name :
	 Radamsa
homepage :
	 https://github.com/aoh/radamsa
url :
	 https://github.com/aoh/radamsa/releases/download/v0.5/radamsa-0.5.tar.gz
description :
	 )
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 man1.install "doc/radamsa.1"
	 prefix.install Dir["*"]
