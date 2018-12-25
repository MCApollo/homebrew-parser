name :
	 Miller
homepage :
	 https://github.com/johnkerl/miller
url :
	 https://github.com/johnkerl/miller/releases/download/5.4.0/mlr-5.4.0.tar.gz
description :
	 Like sed, awk, cut, join & sort for name-indexed data such as CSV
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
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--disable-silent-rules",
	 "--disable-dependency-tracking"
	 system "make"
	 system "make", "check"
	 system "make", "install"
