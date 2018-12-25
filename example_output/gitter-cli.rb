name :
	 GitterCli
homepage :
	 https://github.com/RodrigoEspinosa/gitter-cli
url :
	 https://github.com/RodrigoEspinosa/gitter-cli/archive/v0.8.5.tar.gz
description :
	 Extremely simple Gitter client for terminals
build_deps :
link_deps :
	 node
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink libexec/"bin/gitter-cli"
