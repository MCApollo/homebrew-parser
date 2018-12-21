name :
	 Mboxgrep
homepage :
	 http://www.mboxgrep.org
url :
	 https://downloads.sourceforge.net/project/mboxgrep/mboxgrep/0.7.9/mboxgrep-0.7.9.tar.gz
description :
	 Scan a mailbox for messages matching a regular expression
build_deps :
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}"
	 system "make"
	 system "make", "install"
