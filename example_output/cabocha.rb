name :
	 Cabocha
homepage :
	 https://taku910.github.io/cabocha/
url :
	 https://dl.bintray.com/homebrew/mirror/cabocha-0.69.tar.bz2
description :
	 Yet Another Japanese Dependency Structure Analyzer
build_deps :
link_deps :
	 crf++
	 mecab
	 mecab-ipadic
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["LIBS"] = "-liconv"
	 inreplace "Makefile.in" do |s|
	 s.change_make_var! "CFLAGS", ENV.cflags
	 s.change_make_var! "CXXFLAGS", ENV.cflags
	 end
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-charset=UTF8
	 --with-posset=IPA
	 ]
	 system "./configure", *args
	 system "make", "install"
