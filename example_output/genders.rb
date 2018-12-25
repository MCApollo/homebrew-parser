name :
	 Genders
homepage :
	 https://computing.llnl.gov/linux/genders.html
url :
	 https://downloads.sourceforge.net/project/genders/genders/1.22-1/genders-1.22.tar.gz
description :
	 Static cluster configuration database for cluster management
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
	 system "./configure", "--prefix=#{prefix}", "--with-java-extensions=no"
	 system "make", "install"
