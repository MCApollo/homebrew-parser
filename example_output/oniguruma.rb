name :
	 Oniguruma
homepage :
	 https://github.com/kkos/oniguruma/
url :
	 https://github.com/kkos/oniguruma/releases/download/v6.9.1/onig-6.9.1.tar.gz
description :
	 Regular expressions library
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
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
