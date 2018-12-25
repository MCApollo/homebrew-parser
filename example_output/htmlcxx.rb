name :
	 Htmlcxx
homepage :
	 https://htmlcxx.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/htmlcxx/htmlcxx/0.86/htmlcxx-0.86.tar.gz
description :
	 Non-validating CSS1 and HTML parser for C++
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
