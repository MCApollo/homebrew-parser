name :
	 Tal
homepage :
	 https://web.archive.org/web/20160406172703/https://thomasjensen.com/software/tal/
url :
	 https://www.mirrorservice.org/sites/download.salixos.org/x86_64/extra-14.2/source/misc/tal/tal-1.9.tar.gz
description :
	 Align line endings if they match
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "linux"
	 bin.install "tal"
	 man1.install "tal.1"
