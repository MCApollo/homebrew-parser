name :
	 Sflowtool
homepage :
	 https://inmon.com/technology/sflowTools.php
url :
	 https://github.com/sflow/sflowtool/releases/download/v3.41/sflowtool-3.41.tar.gz
description :
	 Utilities and scripts for analyzing sFlow data
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 (prefix/"contrib").install resource("scripts")
