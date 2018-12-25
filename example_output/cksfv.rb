name :
	 Cksfv
homepage :
	 http://zakalwe.fi/~shd/foss/cksfv/
url :
	 http://zakalwe.fi/~shd/foss/cksfv/files/cksfv-1.3.14.tar.bz2
description :
	 File verification utility
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
