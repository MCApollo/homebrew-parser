name :
	 Fsw
homepage :
	 https://emcrisostomo.github.io/fsw/
url :
	 https://github.com/emcrisostomo/fsw/releases/download/1.3.9/fsw-1.3.9.tar.gz
description :
	 File change monitor with multiple backends
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
	 ENV.append "CXXFLAGS", "-stdlib=libc++"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
