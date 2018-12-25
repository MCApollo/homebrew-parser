name :
	 Avce00
homepage :
	 http://avce00.maptools.org/avce00/index.html
url :
	 http://avce00.maptools.org/dl/avce00-2.0.0.tar.gz
description :
	 Make Arc/Info (binary) Vector Coverages appear as E00
build_deps :
link_deps :
optional_deps :
conflicts :
	 gdal
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}"
	 bin.install "avcimport", "avcexport", "avcdelete", "avctest"
	 lib.install "avc.a"
	 include.install Dir["*.h"]
