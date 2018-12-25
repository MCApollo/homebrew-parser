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
optional_deps :
conflicts :
resource :
	 ['cputime', 'spookyhash']
	 ['https://github.com/centaurean/cputime.git', 'https://github.com/centaurean/spookyhash/archive/spookyhash-1.0.6.tar.gz']
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
