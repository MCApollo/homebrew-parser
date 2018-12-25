name :
	 Befunge93
homepage :
	 https://catseye.tc/node/Befunge-93.html
url :
	 https://catseye.tc/distfiles/befunge-93-2.23-2015.0101.zip
description :
	 Esoteric programming language
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
	 system "make"
	 bin.install Dir["bin/bef*"]
