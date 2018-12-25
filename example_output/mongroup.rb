name :
	 Mongroup
homepage :
	 https://github.com/jgallen23/mongroup
url :
	 https://github.com/jgallen23/mongroup/archive/0.4.1.tar.gz
description :
	 Monitor a group of processes with mon
build_deps :
link_deps :
	 mon
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
