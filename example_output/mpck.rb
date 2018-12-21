name :
	 Mpck
homepage :
	 http://checkmate.gissen.nl/
url :
	 http://checkmate.gissen.nl/checkmate-0.19.tar.gz
description :
	 Check MP3 files for errors
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
