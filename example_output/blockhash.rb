name :
	 Blockhash
homepage :
	 https://github.com/commonsmachinery/blockhash
url :
	 https://github.com/commonsmachinery/blockhash/archive/v0.3.1.tar.gz
description :
	 Perceptual image hash calculation tool
build_deps :
	 pkg-config
link_deps :
	 imagemagick
conflicts :
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
