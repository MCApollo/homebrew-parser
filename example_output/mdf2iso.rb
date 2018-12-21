name :
	 Mdf2iso
homepage :
	 https://packages.debian.org/sid/mdf2iso
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/mdf2iso/mdf2iso_0.3.1.orig.tar.gz
description :
	 Tool to convert MDF (Alcohol 120% images) images to ISO images
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
