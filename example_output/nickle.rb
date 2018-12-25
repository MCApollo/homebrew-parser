name :
	 Nickle
homepage :
	 https://www.nickle.org/
url :
	 https://www.nickle.org/release/nickle-2.81.tar.gz
description :
	 Desk calculator language
build_deps :
link_deps :
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
