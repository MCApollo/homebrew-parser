name :
	 Prodigal
homepage :
	 https://github.com/hyattpd/Prodigal
url :
	 https://github.com/hyattpd/Prodigal/archive/v2.6.3.tar.gz
description :
	 Microbial gene prediction
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "INSTALLDIR=#{bin}"
