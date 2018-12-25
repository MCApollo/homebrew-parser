name :
	 Alac
homepage :
	 https://web.archive.org/web/20150319040222/craz.net/programs/itunes/alac.html
url :
	 https://web.archive.org/web/20150510210401/craz.net/programs/itunes/files/alac_decoder-0.2.0.tgz
description :
	 Basic decoder for Apple Lossless Audio Codec files (ALAC)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "CFLAGS=#{ENV.cflags}", "CC=#{ENV.cc}"
	 bin.install "alac"
