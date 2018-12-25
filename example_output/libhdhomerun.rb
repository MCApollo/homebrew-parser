name :
	 Libhdhomerun
homepage :
	 https://www.silicondust.com/support/linux/
url :
	 https://download.silicondust.com/hdhomerun/libhdhomerun_20180817.tgz
description :
	 C library for controlling SiliconDust HDHomeRun TV tuners
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
	 system "make"
	 bin.install "hdhomerun_config"
	 lib.install "libhdhomerun.dylib"
	 include.install Dir["hdhomerun*.h"]
