name :
	 Lv2
homepage :
	 http://lv2plug.in
url :
	 http://lv2plug.in/spec/lv2-1.14.0.tar.bz2
description :
	 Portable plugin standard for audio systems
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
	 system "./waf", "configure", "--prefix=#{prefix}", "--no-plugins", "--lv2dir=#{lib}"
	 system "./waf", "build"
	 system "./waf", "install"
