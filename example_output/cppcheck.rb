name :
	 Cppcheck
homepage :
	 https://sourceforge.net/projects/cppcheck/
url :
	 https://github.com/danmar/cppcheck/archive/1.86.tar.gz
description :
	 Static analysis of C and C++ code
build_deps :
link_deps :
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "make", "HAVE_RULES=yes", "CFGDIR=#{prefix}/cfg"
	 system "make", "DESTDIR=#{prefix}", "BIN=#{bin}", "CFGDIR=/cfg", "install"
	 (pkgshare/"addons").install Dir.glob(bin/"*.py")
