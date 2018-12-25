name :
	 Ecasound
homepage :
	 https://www.eca.cx/ecasound/
url :
	 https://ecasound.seul.org/download/ecasound-2.9.1.tar.gz
description :
	 Multitrack-capable audio recorder and effect processor
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
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-rubyecasound=no
	 ]
	 system "./configure", *args
	 system "make", "install"
