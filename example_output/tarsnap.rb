name :
	 Tarsnap
homepage :
	 https://www.tarsnap.com/
url :
	 https://www.tarsnap.com/download/tarsnap-autoconf-1.0.39.tgz
description :
	 Online backups for the truly paranoid
build_deps :
link_deps :
	 openssl
	 xz
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "libcperciva/util/monoclock.c", "CLOCK_MONOTONIC",
	 "UNDEFINED_GIBBERISH"
