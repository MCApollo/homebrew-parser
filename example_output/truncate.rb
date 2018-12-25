name :
	 Truncate
homepage :
	 https://www.vanheusden.com/truncate/
url :
	 https://github.com/flok99/truncate/archive/0.9.tar.gz
description :
	 Truncates a file to a given size
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
	 bin.install "truncate"
	 man1.install "truncate.1"
