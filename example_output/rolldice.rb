name :
	 Rolldice
homepage :
	 https://github.com/sstrickl/rolldice
url :
	 https://github.com/sstrickl/rolldice/archive/v1.16.tar.gz
description :
	 Rolls an amount of virtual dice
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}"
	 bin.install "rolldice"
	 man6.install gzip("rolldice.6")
