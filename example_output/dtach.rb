name :
	 Dtach
homepage :
	 https://dtach.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/dtach/dtach/0.9/dtach-0.9.tar.gz
description :
	 Emulates the detach feature of screen
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
	 ENV.append "CFLAGS", "-I."
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 bin.install "dtach"
	 man1.install gzip("dtach.1")
