name :
	 Vilistextum
homepage :
	 https://bhaak.net/vilistextum/
url :
	 https://bhaak.net/vilistextum/vilistextum-2.6.9.tar.gz
description :
	 HTML to text converter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
