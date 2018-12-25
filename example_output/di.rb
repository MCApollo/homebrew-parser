name :
	 Di
homepage :
	 https://gentoo.com/di/
url :
	 https://gentoo.com/di/di-4.47.tar.gz
description :
	 Advanced df-like disk information utility
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
	 system "make", "install", "prefix=#{prefix}"
