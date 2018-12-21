name :
	 Autocode
homepage :
	 https://autocode.readme.io/
url :
	 https://registry.npmjs.org/autocode/-/autocode-1.3.1.tgz
description :
	 Code automation for every language, library and framework
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
