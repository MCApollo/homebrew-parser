name :
	 Fswatch
homepage :
	 https://github.com/emcrisostomo/fswatch
url :
	 https://github.com/emcrisostomo/fswatch/releases/download/1.14.0/fswatch-1.14.0.tar.gz
description :
	 Monitor a directory for changes and run a shell command
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
	 ENV.cxx11
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make", "install"
