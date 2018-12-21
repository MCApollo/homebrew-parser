name :
	 Fx
homepage :
	 https://github.com/antonmedv/fx
url :
	 https://registry.npmjs.org/fx/-/fx-10.0.0.tgz
description :
	 Command-line JSON processing tool
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
