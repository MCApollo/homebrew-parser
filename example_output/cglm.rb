name :
	 Cglm
homepage :
	 https://github.com/recp/cglm
url :
	 https://github.com/recp/cglm/archive/v0.5.0.tar.gz
description :
	 Optimized OpenGL/Graphics Math (glm) for C
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
