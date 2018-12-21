name :
	 Cntlm
homepage :
	 https://cntlm.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cntlm/cntlm/cntlm%200.92.3/cntlm-0.92.3.tar.bz2
description :
	 NTLM authentication proxy with tunneling
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make", "CC=#{ENV.cc}", "SYSCONFDIR=#{etc}"
	 bin.install "cntlm"
	 man1.install "doc/cntlm.1"
	 etc.install "doc/cntlm.conf"
