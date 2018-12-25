name :
	 Libprotoident
homepage :
	 https://research.wand.net.nz/software/libprotoident.php
url :
	 https://research.wand.net.nz/software/libprotoident/libprotoident-2.0.12.tar.gz
description :
	 Performs application layer protocol identification for flows
build_deps :
link_deps :
	 libflowmanager
	 libtrace
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
