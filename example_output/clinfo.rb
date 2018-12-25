name :
	 Clinfo
homepage :
	 https://github.com/Oblomov/clinfo
url :
	 https://github.com/Oblomov/clinfo/archive/2.2.18.04.06.tar.gz
description :
	 Print information about OpenCL platforms and devices
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
	 system "make", "MANDIR=#{man}", "PREFIX=#{prefix}", "install"
