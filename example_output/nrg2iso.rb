name :
	 Nrg2iso
homepage :
	 http://gregory.kokanosky.free.fr/v4/linux/nrg2iso.en.html
url :
	 http://gregory.kokanosky.free.fr/v4/linux/nrg2iso-0.4.tar.gz
description :
	 Extract ISO9660 data from Nero nrg files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "nrg2iso"
