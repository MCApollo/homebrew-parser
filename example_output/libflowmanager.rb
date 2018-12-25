name :
	 Libflowmanager
homepage :
	 https://research.wand.net.nz/software/libflowmanager.php
url :
	 https://research.wand.net.nz/software/libflowmanager/libflowmanager-3.0.0.tar.gz
description :
	 Flow-based measurement tasks with packet-based inputs
build_deps :
link_deps :
	 libtrace
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
