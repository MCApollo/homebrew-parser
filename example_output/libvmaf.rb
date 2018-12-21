name :
	 Libvmaf
homepage :
	 https://github.com/Netflix/vmaf
url :
	 https://github.com/Netflix/vmaf/archive/v1.3.9.tar.gz
description :
	 Perceptual video quality assessment based on multi-method fusion
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "INSTALL_PREFIX=#{prefix}"
	 system "make", "testlib", "INSTALL_PREFIX=#{prefix}"
	 pkgshare.install "wrapper/testlib"
	 pkgshare.install "python/test/resource/yuv/src01_hrc00_576x324.yuv"
