name :
	 Libghthash
homepage :
	 https://web.archive.org/web/20170824230514/www.bth.se/people/ska/sim_home/libghthash.html
url :
	 https://web.archive.org/web/20170824230514/www.bth.se/people/ska/sim_home/filer/libghthash-0.6.2.tar.gz
description :
	 Generic hash table for C++
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-ivf"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
