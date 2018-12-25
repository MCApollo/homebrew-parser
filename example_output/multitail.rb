name :
	 Multitail
homepage :
	 https://vanheusden.com/multitail/
url :
	 https://vanheusden.com/multitail/multitail-6.4.2.tgz
description :
	 Tail multiple files in one terminal simultaneously
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
	 system "make", "-f", "makefile.macosx", "multitail", "DESTDIR=#{HOMEBREW_PREFIX}"
	 bin.install "multitail"
	 man1.install gzip("multitail.1")
	 etc.install "multitail.conf"
