name :
	 TokyoDystopia
homepage :
	 https://fallabs.com/tokyodystopia/
url :
	 https://fallabs.com/tokyodystopia/tokyodystopia-0.9.15.tar.gz
description :
	 Lightweight full-text search system
build_deps :
link_deps :
	 tokyo-cabinet
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
