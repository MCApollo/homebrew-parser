name :
	 Ddate
homepage :
	 https://github.com/bo0ts/ddate
url :
	 https://github.com/bo0ts/ddate/archive/v0.2.2.tar.gz
description :
	 Converts boring normal dates to fun Discordian Date
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, "ddate.c", "-o", "ddate"
	 bin.install "ddate"
	 man1.install "ddate.1"
