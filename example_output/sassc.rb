name :
	 Sassc
homepage :
	 https://github.com/sass/sassc
url :
	 https://github.com/sass/sassc.git
description :
	 Wrapper around libsass that helps to create command-line apps
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libsass
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--prefix=#{prefix}", "--disable-silent-rules",
	 "--disable-dependency-tracking"
	 system "make", "install"
