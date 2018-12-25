name :
	 Jsdoc3
homepage :
	 http://usejsdoc.org/
url :
	 https://registry.npmjs.org/jsdoc/-/jsdoc-3.5.5.tgz
description :
	 API documentation generator for JavaScript
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
