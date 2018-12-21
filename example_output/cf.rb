name :
	 Cf
homepage :
	 https://ee.lbl.gov/
url :
	 https://ee.lbl.gov/downloads/cf/cf-1.2.5.tar.gz
description :
	 Filter to replace numeric timestamps with a formated date time
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 bin.mkpath
	 man1.mkpath
	 system "make", "install"
	 system "make", "install-man"
