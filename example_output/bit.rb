name :
	 Bit
homepage :
	 https://www.bitsrc.io
url :
	 https://registry.npmjs.org/bit-bin/-/bit-bin-13.0.4.tgz
description :
	 Distributed Code Component Manager
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
