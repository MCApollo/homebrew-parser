name :
	 Lilv
homepage :
	 https://drobilla.net/software/lilv/
url :
	 https://download.drobilla.net/lilv-0.24.2.tar.bz2
description :
	 C library to use LV2 plugins
build_deps :
	 pkg-config
link_deps :
	 lv2
	 serd
	 sord
	 sratom
conflicts :
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
