name :
	 Mon
homepage :
	 https://github.com/visionmedia/mon
url :
	 https://github.com/visionmedia/mon/archive/1.2.3.tar.gz
description :
	 Monitor hosts/services/whatever and alert about problems
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
	 bin.mkpath
	 system "make", "install", "PREFIX=#{prefix}"
