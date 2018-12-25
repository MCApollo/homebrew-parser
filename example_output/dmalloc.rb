name :
	 Dmalloc
homepage :
	 http://dmalloc.com
url :
	 http://dmalloc.com/releases/dmalloc-5.5.2.tgz
description :
	 Debug versions of system memory management routines
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
	 system "./configure", "--enable-threads", "--prefix=#{prefix}"
	 system "make", "install", "installth", "installcxx", "installthcxx"
