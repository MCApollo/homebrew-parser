name :
	 Jsonpp
homepage :
	 https://jmhodges.github.io/jsonpp/
url :
	 https://github.com/jmhodges/jsonpp/archive/1.3.0.tar.gz
description :
	 Command-line JSON pretty-printer
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "go", "build", "-o", bin/"jsonpp"
