name :
	 Compface
homepage :
	 https://web.archive.org/web/20170720045032/freecode.com/projects/compface
url :
	 https://mirrorservice.org/sites/ftp.xemacs.org/pub/xemacs/aux/compface-1.5.2.tar.gz
description :
	 Convert to and from the X-Face format
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
