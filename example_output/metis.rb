name :
	 Metis
homepage :
	 http://glaros.dtc.umn.edu/gkhome/views/metis
url :
	 http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz
description :
	 Programs that partition graphs and order matrices
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "config", "prefix=#{prefix}", "shared=1"
	 system "make", "install"
	 pkgshare.install "graphs"
