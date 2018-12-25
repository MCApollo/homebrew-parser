name :
	 Procmail
homepage :
	 https://web.archive.org/web/20151013184044/procmail.org/
url :
	 https://opensource.apple.com/tarballs/procmail/procmail-14.tar.gz
description :
	 Autonomous mail processor
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "-C", "procmail", "BASENAME=#{prefix}", "MANDIR=#{man}",
	 "LOCKINGTEST=1", "install"
