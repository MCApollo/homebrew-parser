name :
	 Ncp
homepage :
	 https://www.fefe.de/ncp/
url :
	 https://dl.fefe.de/ncp-1.2.4.tar.bz2
description :
	 File copy tool for LANs
build_deps :
link_deps :
	 libowfat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/plumbojumbo/9331146/raw/560e46a688ac9493ffbc1464e59cc062c0940532/GNUmakefile.diff
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}",
	 "LIBOWFAT_PREFIX=#{Formula["libowfat"].opt_prefix}"
	 system "make", "PREFIX=#{prefix}", "install"
