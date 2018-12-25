name :
	 Atool
homepage :
	 https://savannah.nongnu.org/projects/atool/
url :
	 https://savannah.nongnu.org/download/atool/atool-0.39.0.tar.gz
description :
	 Archival front-end
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
