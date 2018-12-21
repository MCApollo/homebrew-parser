name :
	 Bioawk
homepage :
	 https://github.com/lh3/bioawk
url :
	 https://github.com/lh3/bioawk/archive/v1.0.tar.gz
description :
	 AWK modified for biological data
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make"
	 bin.install "bioawk"
	 man1.install "awk.1" => "bioawk.1"
