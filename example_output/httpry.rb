name :
	 Httpry
homepage :
	 https://github.com/jbittel/httpry
url :
	 https://github.com/jbittel/httpry/archive/httpry-0.1.8.tar.gz
description :
	 Packet sniffer for displaying and logging HTTP traffic
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
	 bin.install "httpry"
	 man1.install "httpry.1"
	 doc.install Dir["doc/*"]
