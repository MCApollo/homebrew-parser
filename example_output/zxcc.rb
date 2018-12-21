name :
	 Zxcc
homepage :
	 https://www.seasip.info/Unix/Zxcc/
url :
	 https://www.seasip.info/Unix/Zxcc/zxcc-0.5.7.tar.gz
description :
	 CP/M 2/3 emulator for cross-compiling and CP/M tools under UNIX
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
