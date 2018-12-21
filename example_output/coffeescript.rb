name :
	 Coffeescript
homepage :
	 https://coffeescript.org/
url :
	 https://registry.npmjs.org/coffeescript/-/coffeescript-2.3.2.tgz
description :
	 Unfancy JavaScript
build_deps :
link_deps :
	 node
conflicts :
	 cake
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
