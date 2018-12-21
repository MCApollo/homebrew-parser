name :
	 Unison
homepage :
	 https://www.cis.upenn.edu/~bcpierce/unison/
url :
	 https://github.com/bcpierce00/unison/archive/v2.51.2.tar.gz
description :
	 File synchronization tool for OSX
build_deps :
	 ocaml
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.delete "CFLAGS"
	 ENV.delete "NAME"
	 system "make", "UISTYLE=text"
	 bin.install "src/unison"
	 prefix.install_metafiles "src"
