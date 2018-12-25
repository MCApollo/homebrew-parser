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
optional_deps :
conflicts :
resource :
	 ['testdata']
	 ['https://raw.githubusercontent.com/commonsmachinery/blockhash/ce08b465b658c4e886d49ec33361cee767f86db6/testdata/clipper_ship.jpg']
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
