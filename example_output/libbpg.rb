name :
	 Libbpg
homepage :
	 https://bellard.org/bpg/
url :
	 https://bellard.org/bpg/libbpg-0.9.8.tar.gz
description :
	 Image format meant to improve on JPEG quality and file size
build_deps :
	 cmake
	 yasm
link_deps :
	 jpeg
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 system "make", "install", "prefix=#{prefix}", "CONFIG_APPLE=y"
	 pkgshare.install Dir["html/bpgdec*.js"]
