name :
	 Pmccabe
homepage :
	 https://packages.debian.org/sid/pmccabe
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/p/pmccabe/pmccabe_2.6.tar.gz
description :
	 Calculate McCabe-style cyclomatic complexity for C/C++ code
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-D__unix"
	 system "make"
	 bin.install "pmccabe", "codechanges", "decomment", "vifn"
	 man1.install Dir["*.1"]
