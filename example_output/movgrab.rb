name :
	 Movgrab
homepage :
	 https://sites.google.com/site/columscode/home/movgrab
url :
	 https://sites.google.com/site/columscode/files/movgrab-1.2.1.tar.gz
description :
	 Downloader for youtube, dailymotion, and other video websites
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
	 system "make"
	 rm "INSTALL"
	 system "make", "install"
