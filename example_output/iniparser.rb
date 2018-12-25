name :
	 Iniparser
homepage :
	 http://ndevilla.free.fr/iniparser/
url :
	 http://ndevilla.free.fr/iniparser/iniparser-3.1.tar.gz
description :
	 Library for parsing ini files
build_deps :
link_deps :
optional_deps :
conflicts :
	 fastbit
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "libiniparser.a", "CC=#{ENV.cc}", "RANLIB=ranlib"
	 lib.install "libiniparser.a"
	 include.install Dir["src/*.h"]
