name :
	 Roundup
homepage :
	 https://bmizerany.github.io/roundup
url :
	 https://github.com/bmizerany/roundup/archive/v0.0.6.tar.gz
description :
	 Unit testing tool
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
	 system "./configure", "--prefix=#{prefix}",
	 "--bindir=#{bin}",
	 "--mandir=#{man}",
	 "--sysconfdir=#{etc}",
	 "--datarootdir=#{share}"
	 system "make"
	 system "make", "install"
