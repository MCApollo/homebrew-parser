name :
	 Mldonkey
homepage :
	 https://mldonkey.sourceforge.io
url :
	 https://github.com/ygrek/mldonkey/releases/download/release-3-1-6/mldonkey-3.1.6.tar.bz2
description :
	 OCaml/GTK client for the eDonkey P2P network
build_deps :
	 camlp4
	 ocaml
	 ocaml-num
	 pkg-config
link_deps :
	 gd
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 ENV["OCAMLPARAM"] = "safe-string=0,_"
	 ENV.deparallelize
	 ENV["OCAMLC"] = "#{HOMEBREW_PREFIX}/bin/ocamlc.opt -cc #{ENV.cc}"
	 system "./configure", "--prefix=#{prefix}", "--disable-magic"
	 system "make", "install"
