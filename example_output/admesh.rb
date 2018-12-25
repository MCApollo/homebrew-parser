name :
	 Admesh
homepage :
	 https://github.com/admesh/admesh
url :
	 https://github.com/admesh/admesh/releases/download/v0.98.3/admesh-0.98.3.tar.gz
description :
	 Processes triangulated solid meshes
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
