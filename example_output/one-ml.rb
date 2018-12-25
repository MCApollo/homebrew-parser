name :
	 OneMl
homepage :
	 https://www.mpi-sws.org/~rossberg/1ml/
url :
	 https://www.mpi-sws.org/~rossberg/1ml/1ml-0.1.zip
description :
	 Reboot of ML, unifying its core and (now first-class) module layers
build_deps :
	 ocaml
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OCAMLPARAM"] = "safe-string=0,_"
	 system "make"
	 bin.install "1ml"
	 (pkgshare/"stdlib").install Dir.glob("*.1ml")
	 doc.install "README.txt"
