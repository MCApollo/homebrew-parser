name :
	 Robotfindskitten
homepage :
	 http://robotfindskitten.org/
url :
	 https://downloads.sourceforge.net/project/rfk/robotfindskitten-POSIX/mayan_apocalypse_edition/robotfindskitten-2.7182818.701.tar.gz
description :
	 Zen Simulation of robot finding kitten
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
	 "--prefix=#{prefix}"
	 system "make", "install", "execgamesdir=#{bin}"
