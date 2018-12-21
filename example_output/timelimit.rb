name :
	 Timelimit
homepage :
	 https://devel.ringlet.net/sysutils/timelimit/
url :
	 https://devel.ringlet.net/files/sys/timelimit/timelimit-1.9.0.tar.gz
description :
	 Limit a process's absolute execution time
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "-o ${BINOWN} -g ${BINGRP}", ""
	 inreplace "Makefile", "-o ${SHAREOWN} -g ${SHAREGRP}", ""
	 args = %W[LOCALBASE=#{prefix} MANDIR=#{man}/man]
	 check_args = args + ["check"]
	 install_args = args + ["install"]
	 system "make", *check_args
	 system "make", *install_args
