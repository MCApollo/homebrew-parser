name :
	 Icu4c
homepage :
	 https://ssl.icu-project.org/
url :
	 https://ssl.icu-project.org/files/icu4c/63.1/icu4c-63_1-src.tgz
description :
	 C/C++ and Java libraries for Unicode and globalization
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
	 args = %W[--prefix=#{prefix} --disable-samples --disable-tests --enable-static]
	 args << "--with-library-bits=64" if MacOS.prefer_64_bit?
	 cd "source" do
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 end
