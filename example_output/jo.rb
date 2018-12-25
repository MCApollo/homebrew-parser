name :
	 Jo
homepage :
	 https://github.com/jpmens/jo
url :
	 https://github.com/jpmens/jo/releases/download/v1.1/jo-1.1.tar.gz
description :
	 JSON output from a shell
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
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
