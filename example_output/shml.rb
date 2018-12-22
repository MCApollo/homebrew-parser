name :
	 Shml
homepage :
	 https://odb.github.io/shml/
url :
	 https://github.com/MaxCDN/shml/archive/1.1.0.tar.gz
description :
	 Style Framework for The Terminal
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "shml.sh"
	 bin.install_symlink bin/"shml.sh" => "shml"
