name :
	 Myman
homepage :
	 https://myman.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/myman/myman-cvs/myman-cvs-2009-10-30/myman-wip-2009-10-30.tar.gz
description :
	 Text-mode videogame inspired by Namco's Pac-Man
build_deps :
	 coreutils
	 gnu-sed
	 groff
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["RMDIR"] = "grmdir"
	 ENV["SED"] = "gsed"
	 ENV["INSTALL"] = "ginstall"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
