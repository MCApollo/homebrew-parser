name :
	 Znc
homepage :
	 https://wiki.znc.in/ZNC
url :
	 https://znc.in/releases/archive/znc-1.7.1.tar.gz
description :
	 Advanced IRC bouncer
build_deps :
	 pkg-config
link_deps :
	 openssl
	 icu4c
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV.append "CXXFLAGS", "-std=c++11"
	 ENV.append "CXXFLAGS", "-stdlib=libc++" if ENV.compiler == :clang
	 args = ["--prefix=#{prefix}"]
	 args << "--enable-python" if build.with? "python"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
