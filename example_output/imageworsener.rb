name :
	 Imageworsener
homepage :
	 https://entropymine.com/imageworsener/
url :
	 https://entropymine.com/imageworsener/imageworsener-1.3.3.tar.gz
description :
	 Utility and library for image scaling and processing
build_deps :
link_deps :
	 jpeg
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 inreplace "./scripts/autogen.sh", "libtoolize", "glibtoolize"
	 system "./scripts/autogen.sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--without-webp"
	 system "make", "install"
	 pkgshare.install "tests"
