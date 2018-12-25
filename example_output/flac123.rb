name :
	 Flac123
homepage :
	 https://flac-tools.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/flac-tools/flac123/flac123-0.0.12-release.tar.gz
description :
	 Command-line program for playing FLAC audio files
build_deps :
	 autoconf
	 automake
link_deps :
	 flac
	 libao
	 libogg
	 popt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install", "CC=#{ENV.cc}",
	 "ACLOCAL=${SHELL} #{buildpath}/missing --run aclocal",
	 "AUTOMAKE=${SHELL} #{buildpath}/missing --run automake"
