name :
	 Posh
homepage :
	 https://salsa.debian.org/clint/posh
url :
	 https://salsa.debian.org/clint/posh/repository/debian/0.13.2/archive.tar.gz
description :
	 Policy-compliant ordinary shell
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
