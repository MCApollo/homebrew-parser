name :
	 Reop
homepage :
	 https://web.archive.org/web/20170706070539/www.tedunangst.com/flak/post/reop
url :
	 https://web.archive.org/web/20170706070539/www.tedunangst.com/flak/files/reop-2.1.0.tgz
description :
	 Encrypted keypair management
build_deps :
link_deps :
	 libsodium
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-f", "GNUmakefile"
	 bin.install "reop"
	 man1.install "reop.1"
