name :
	 AngularCli
homepage :
	 https://cli.angular.io/
url :
	 https://registry.npmjs.org/@angular/cli/-/cli-7.1.3.tgz
description :
	 CLI tool for Angular
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
