name :
	 WriteGood
homepage :
	 https://github.com/btford/write-good
url :
	 https://github.com/btford/write-good/archive/v0.10.0.tar.gz
description :
	 Naive linter for English prose
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
	 bin.install_symlink Dir["#{libexec}/bin/*"]
