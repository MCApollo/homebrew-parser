name :
	 Cityhash
homepage :
	 https://github.com/google/cityhash
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cityhash/cityhash-1.1.1.tar.gz
description :
	 Hash functions for strings
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
	 system "make", "install"
