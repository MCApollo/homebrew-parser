name :
	 Mailcheck
homepage :
	 https://mailcheck.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mailcheck/mailcheck/1.91.2/mailcheck_1.91.2.tar.gz
description :
	 Check multiple mailboxes/maildirs for mail
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "mailcheck"
	 bin.install "mailcheck"
	 man1.install "mailcheck.1"
	 etc.install "mailcheckrc"
