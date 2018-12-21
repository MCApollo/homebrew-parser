name :
	 GruntCli
homepage :
	 https://gruntjs.com/
url :
	 https://registry.npmjs.org/grunt-cli/-/grunt-cli-1.3.2.tgz
description :
	 JavaScript Task Runner
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
