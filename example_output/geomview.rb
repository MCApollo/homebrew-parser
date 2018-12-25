name :
	 Geomview
homepage :
	 http://www.geomview.org
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/g/geomview/geomview_1.9.5.orig.tar.gz
description :
	 Interactive 3D viewing program
build_deps :
link_deps :
	 openmotif
	 :x11
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
	 (bin/"hvectext").unlink
