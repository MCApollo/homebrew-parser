name :
	 Tractorgen
homepage :
	 http://www.kfish.org/software/tractorgen/
url :
	 http://www.kfish.org/software/tractorgen/dl/tractorgen-0.31.7.tar.gz
description :
	 Generates ASCII tractor art
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
