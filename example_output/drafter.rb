name :
	 Drafter
homepage :
	 https://apiblueprint.org/
url :
	 https://github.com/apiaryio/drafter/releases/download/v3.2.7/drafter-v3.2.7.tar.gz
description :
	 Native C/C++ API Blueprint Parser
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make", "install", "DESTDIR=#{prefix}"
