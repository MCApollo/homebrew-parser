name :
	 Gambit
homepage :
	 http://www.gambit-project.org
url :
	 https://github.com/gambitproject/gambit/archive/v15.1.1.tar.gz
description :
	 Software tools for game theory
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 wxmac
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "contrib"
