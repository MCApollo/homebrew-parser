name :
	 Hstr
homepage :
	 https://github.com/dvorka/hstr
url :
	 https://github.com/dvorka/hstr/archive/2.0.tar.gz
description :
	 Bash and zsh history suggest box
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
