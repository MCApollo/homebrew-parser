name :
	 Serverless
homepage :
	 https://serverless.com
url :
	 https://registry.npmjs.org/serverless/-/serverless-1.33.1.tgz
description :
	 Build applications with serverless architectures
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
