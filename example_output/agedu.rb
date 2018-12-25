name :
	 Agedu
homepage :
	 https://www.chiark.greenend.org.uk/~sgtatham/agedu/
url :
	 https://www.chiark.greenend.org.uk/~sgtatham/agedu/agedu-20180522.5b12791.tar.gz
description :
	 Unix utility for tracking down wasted disk space
build_deps :
	 autoconf
	 automake
	 halibut
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./mkauto.sh"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
