name :
	 Eslint
homepage :
	 https://eslint.org
url :
	 https://registry.npmjs.org/eslint/-/eslint-5.10.0.tgz
description :
	 AST-based pattern checker for JavaScript
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
