name :
	 Libsmi
homepage :
	 https://www.ibr.cs.tu-bs.de/projects/libsmi/
url :
	 https://www.ibr.cs.tu-bs.de/projects/libsmi/download/libsmi-0.5.0.tar.gz
description :
	 Library to Access SMI MIB Information
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
