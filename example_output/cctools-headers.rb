name :
	 CctoolsHeaders
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/cctools/cctools-855.tar.gz
description :
	 cctools headers via Apple
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "include/Makefile", "/usr/include", "/include"
	 system "make", "installhdrs", "DSTROOT=#{prefix}", "RC_ProjectSourceVersion=#{version}"
	 (prefix/"usr").rmtree
	 resource("headers").stage { (include/"mach").install "osfmk/mach/machine.h" }
