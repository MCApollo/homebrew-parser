name :
	 VowpalWabbit
homepage :
	 https://github.com/JohnLangford/vowpal_wabbit
url :
	 https://github.com/JohnLangford/vowpal_wabbit/archive/8.6.1.tar.gz
description :
	 Online learning algorithm
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 boost
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["AC_PATH"] = "#{HOMEBREW_PREFIX}/share"
	 system "./autogen.sh", "--prefix=#{prefix}",
	 "--with-boost=#{Formula["boost"].opt_prefix}"
	 system "make"
	 system "make", "install"
	 bin.install Dir["utl/*"]
	 rm bin/"active_interactor.py"
	 rm bin/"new_version"
	 rm bin/"vw-validate.html"
	 rm bin/"release.ps1"
