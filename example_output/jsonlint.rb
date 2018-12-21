name :
	 Jsonlint
homepage :
	 https://github.com/zaach/jsonlint
url :
	 https://github.com/zaach/jsonlint/archive/v1.6.0.tar.gz
description :
	 JSON parser and validator with a CLI
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
