name :
	 Vmtouch
homepage :
	 https://hoytech.com/vmtouch/
url :
	 https://github.com/hoytech/vmtouch/archive/v1.3.0.tar.gz
description :
	 Portable file system cache diagnostics and control
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}", "MANDIR=#{man}"
