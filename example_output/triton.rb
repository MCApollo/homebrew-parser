name :
	 Triton
homepage :
	 https://www.npmjs.com/package/triton
url :
	 https://registry.npmjs.org/triton/-/triton-6.1.2.tgz
description :
	 Joyent Triton CLI
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
