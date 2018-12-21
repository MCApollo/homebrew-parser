name :
	 Robodoc
homepage :
	 https://www.xs4all.nl/~rfsber/Robo/index.html
url :
	 https://rfsber.home.xs4all.nl/Robo/archives/robodoc-4.99.43.tar.bz2
description :
	 Source code documentation tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-f", "-i" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make", "install"
