name :
	 Mpdas
homepage :
	 https://www.50hz.ws/mpdas/
url :
	 https://www.50hz.ws/mpdas/mpdas-0.4.5.tar.gz
description :
	 C++ client to submit tracks to audioscrobbler
build_deps :
	 pkg-config
link_deps :
	 libmpdclient
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "MANPREFIX=#{man1}", "CONFIG=#{etc}", "install"
	 etc.install "mpdasrc.example"
