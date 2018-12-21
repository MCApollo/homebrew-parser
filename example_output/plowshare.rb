name :
	 Plowshare
homepage :
	 https://github.com/mcrapet/plowshare
url :
	 https://github.com/mcrapet/plowshare/archive/v2.1.7.tar.gz
description :
	 Download/upload tool for popular file sharing websites
build_deps :
link_deps :
	 bash
	 coreutils
	 feh
	 gnu-sed
	 libcaca
	 recode
	 spidermonkey
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "patch_gnused", "GNU_SED=#{Formula["gnu-sed"].opt_bin}/gsed", "PREFIX=#{prefix}"
