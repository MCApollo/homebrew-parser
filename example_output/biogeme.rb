name :
	 Biogeme
homepage :
	 https://biogeme.epfl.ch/
url :
	 https://biogeme.epfl.ch/distrib/biogeme-2.6a.tar.gz
description :
	 Maximum likelihood estimation of choice models
build_deps :
link_deps :
	 gtkmm3
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
