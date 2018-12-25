name :
	 Libyaml
homepage :
	 https://github.com/yaml/libyaml
url :
	 https://github.com/yaml/libyaml/archive/0.2.1.tar.gz
description :
	 YAML Parser
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
