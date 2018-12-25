name :
	 Ntl
homepage :
	 https://www.shoup.net/ntl
url :
	 https://www.shoup.net/ntl/ntl-11.3.0.tar.gz
description :
	 C++ number theory library
build_deps :
link_deps :
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = ["PREFIX=#{prefix}", "SHARED=on"]
	 cd "src" do
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 end
