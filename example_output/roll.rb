name :
	 Roll
homepage :
	 https://matteocorti.github.io/roll/
url :
	 https://github.com/matteocorti/roll/releases/download/v2.4.0/roll-2.4.0.tar.gz
description :
	 CLI program for rolling a dice sequence
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./regen.sh" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
