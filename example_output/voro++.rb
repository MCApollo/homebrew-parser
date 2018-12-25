name :
	 Voroxx
homepage :
	 http://math.lbl.gov/voro++
url :
	 http://math.lbl.gov/voro++/download/dir/voro++-0.4.6.tar.gz
description :
	 3D Voronoi cell software library
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
	 system "make", "install", "PREFIX=#{prefix}"
	 pkgshare.install("examples")
	 mv prefix/"man", share/"man"
