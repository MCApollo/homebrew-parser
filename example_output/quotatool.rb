name :
	 Quotatool
homepage :
	 https://quotatool.ekenberg.se/
url :
	 https://quotatool.ekenberg.se/quotatool-1.6.2.tar.gz
description :
	 Edit disk quotas from the command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 sbin.mkpath
	 man8.mkpath
	 system "make", "install"
