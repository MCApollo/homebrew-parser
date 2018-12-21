name :
	 Bcpp
homepage :
	 https://invisible-island.net/bcpp/
url :
	 https://invisible-mirror.net/archives/bcpp/bcpp-20180401.tgz
description :
	 C(++) beautifier
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
	 etc.install "bcpp.cfg"
