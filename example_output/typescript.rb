name :
	 Typescript
homepage :
	 https://www.typescriptlang.org/
url :
	 https://registry.npmjs.org/typescript/-/typescript-3.2.2.tgz
description :
	 Language for application scale JavaScript development
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
