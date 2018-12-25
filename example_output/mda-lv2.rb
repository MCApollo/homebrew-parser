name :
	 MdaLv2
homepage :
	 https://drobilla.net/software/mda-lv2/
url :
	 https://download.drobilla.net/mda-lv2-1.2.2.tar.bz2
description :
	 LV2 port of the MDA plugins
build_deps :
	 pkg-config
link_deps :
	 lv2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
