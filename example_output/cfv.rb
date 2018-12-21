name :
	 Cfv
homepage :
	 https://cfv.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cfv/cfv/1.18.3/cfv-1.18.3.tar.gz
description :
	 Test and create various files (e.g., .sfv, .csv, .crc., .torrent)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "mandir=#{man}", "install"
