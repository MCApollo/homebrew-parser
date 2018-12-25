name :
	 Ssdeep
homepage :
	 https://ssdeep-project.github.io/ssdeep/
url :
	 https://github.com/ssdeep-project/ssdeep/releases/download/release-2.14.1/ssdeep-2.14.1.tar.gz
description :
	 Recursive piecewise hashing tool
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
