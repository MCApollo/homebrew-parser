name :
	 Nethogs
homepage :
	 https://raboof.github.io/nethogs/
url :
	 https://github.com/raboof/nethogs/archive/v0.8.5.tar.gz
description :
	 Net top tool grouping bandwidth per process
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
	 system "make", "install", "PREFIX=#{prefix}"
