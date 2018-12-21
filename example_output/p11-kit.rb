name :
	 P11Kit
homepage :
	 https://p11-glue.freedesktop.org
url :
	 https://github.com/p11-glue/p11-kit/releases/download/0.23.14/p11-kit-0.23.14.tar.gz
description :
	 Library to load and enumerate PKCS#11 modules
build_deps :
	 pkg-config
link_deps :
	 libffi
conflicts :
patches :
EOF_patch :
install :
	 ENV["FAKED_MODE"] = "1"
	 if build.head?
	 ENV["NOCONFIGURE"] = "1"
	 system "./autogen.sh"
