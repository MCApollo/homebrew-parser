name :
	 Tracebox
homepage :
	 https://www.tracebox.org/
url :
	 https://github.com/tracebox/tracebox.git
description :
	 Middlebox detection tool
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 json-c
	 lua
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.libcxx
	 system "autoreconf", "--install"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
