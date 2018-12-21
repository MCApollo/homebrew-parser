name :
	 Serialosc
homepage :
	 https://monome.org/docs/osc/
url :
	 https://github.com/monome/serialosc.git
description :
	 Opensound control server for monome devices
build_deps :
link_deps :
	 confuse
	 liblo
	 libmonome
conflicts :
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf", "build"
	 system "./waf", "install"
