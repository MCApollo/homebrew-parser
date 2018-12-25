name :
	 Suil
homepage :
	 https://drobilla.net/software/suil/
url :
	 https://download.drobilla.net/suil-0.10.0.tar.bz2
description :
	 Lightweight C library for loading and wrapping LV2 plugin UIs
build_deps :
	 pkg-config
link_deps :
	 lv2
	 gtk+
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf", "install"
