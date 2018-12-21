name :
	 Afio
homepage :
	 http://members.chello.nl/~k.holtman/afio.html
url :
	 http://members.chello.nl/~k.holtman/afio-2.5.1.tgz
description :
	 Creates cpio-format archives
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "DESTDIR=#{prefix}"
	 bin.install "afio"
	 man1.install "afio.1"
	 prefix.install "ANNOUNCE-2.5.1" => "ANNOUNCE"
	 prefix.install %w[INSTALLATION SCRIPTS]
	 share.install Dir["script*"]
