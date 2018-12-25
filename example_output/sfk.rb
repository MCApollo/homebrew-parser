name :
	 Sfk
homepage :
	 http://stahlworks.com/dev/swiss-file-knife.html
url :
	 https://downloads.sourceforge.net/project/swissfileknife/1-swissfileknife/1.9.2.0/sfk-1.9.2.tar.gz
description :
	 Command-line tools collection
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
	 ENV.libstdcxx
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
