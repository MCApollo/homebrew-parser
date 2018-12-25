name :
	 Nesc
homepage :
	 https://github.com/tinyos/nesc
url :
	 https://github.com/tinyos/nesc/archive/v1.4.0.tar.gz
description :
	 Programming language for deeply networked systems
build_deps :
	 autoconf
	 automake
	 :java
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./Bootstrap"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
