name :
	 Nodeenv
homepage :
	 https://github.com/ekalinin/nodeenv
url :
	 https://github.com/ekalinin/nodeenv/archive/1.3.3.tar.gz
description :
	 Node.js virtual environment builder
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
	 bin.install "nodeenv.py" => "nodeenv"
