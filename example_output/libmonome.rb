name :
	 Libmonome
homepage :
	 https://monome.org/
url :
	 https://github.com/monome/libmonome/archive/v1.4.2.tar.gz
description :
	 Interact with monome devices via C, Python, or FFI
build_deps :
link_deps :
	 liblo
conflicts :
patches :
EOF_patch :
install :
	 inreplace "wscript", /conf.env.append_unique.*-mmacosx-version-min=10.5.*/,
	 "pass"
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf", "build"
	 system "./waf", "install"
