name :
	 ResinCli
homepage :
	 https://docs.resin.io/reference/cli/
url :
	 https://registry.npmjs.org/resin-cli/-/resin-cli-8.0.2.tgz
description :
	 The official resin.io CLI tool
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
