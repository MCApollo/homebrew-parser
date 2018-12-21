name :
	 Ecm
homepage :
	 https://web.archive.org/web/20140227165748/www.neillcorlett.com/ecm/
url :
	 https://web.archive.org/web/20091021035854/www.neillcorlett.com/downloads/ecm100.zip
description :
	 Prepare CD image files so they compress better
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, "-o", "ecm", "ecm.c"
	 system ENV.cc, "-o", "unecm", "unecm.c"
	 bin.install "ecm", "unecm"
