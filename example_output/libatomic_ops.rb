name :
	 LibatomicOps
homepage :
	 https://github.com/ivmai/libatomic_ops/
url :
	 https://github.com/ivmai/libatomic_ops/releases/download/v7.6.8/libatomic_ops-7.6.8.tar.gz
description :
	 Implementations for atomic memory update operations
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
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
