name :
	 Arabica
homepage :
	 https://www.jezuk.co.uk/cgi-bin/view/arabica
url :
	 https://github.com/jezhiggins/arabica/archive/2016-January.tar.gz
description :
	 XML toolkit written in C++
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 boost
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
