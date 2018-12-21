name :
	 Density
homepage :
	 https://github.com/centaurean/density
url :
	 https://github.com/centaurean/density/archive/density-0.14.2.tar.gz
description :
	 Superfast compression library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"benchmark/libs/cputime").install resource("cputime")
	 (buildpath/"benchmark/libs/spookyhash").install resource("spookyhash")
	 system "make"
	 include.install "src/density_api.h"
	 pkgshare.install "build/benchmark"
	 lib.install "build/libdensity.a"
	 lib.install "build/libdensity.dylib"
