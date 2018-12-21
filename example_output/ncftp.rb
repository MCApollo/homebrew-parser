name :
	 Ncftp
homepage :
	 https://www.ncftp.com/
url :
	 ftp://ftp.ncftp.com/ncftp/ncftp-3.2.6-src.tar.gz
description :
	 FTP client with an advanced user interface
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-universal",
	 "--disable-precomp",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
