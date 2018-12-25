name :
	 Analog
homepage :
	 https://tracker.debian.org/pkg/analog
url :
	 https://deb.debian.org/debian/pool/main/a/analog/analog_6.0.orig.tar.gz
description :
	 Logfile analyzer
build_deps :
link_deps :
	 gd
	 jpeg
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "DEFS='-DLANGDIR=\"#{pkgshare}/lang/\"' -DHAVE_ZLIB",
	 "LIBS=-lz",
	 "OS=OSX"
	 bin.install "analog"
	 pkgshare.install "examples", "how-to", "images", "lang"
	 pkgshare.install "analog.cfg" => "analog.cfg-dist"
	 (pkgshare/"examples").install "logfile.log"
	 man1.install "analog.man" => "analog.1"
