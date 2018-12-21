name :
	 Tmpreaper
homepage :
	 https://packages.debian.org/sid/tmpreaper
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/t/tmpreaper/tmpreaper_1.6.13+nmu1.tar.gz
description :
	 Clean up files in directories based on their age
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
	 system "make", "install"
