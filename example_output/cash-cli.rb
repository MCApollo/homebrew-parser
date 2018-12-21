name :
	 CashCli
homepage :
	 https://github.com/xxczaki/cash-cli
url :
	 https://registry.npmjs.org/cash-cli/-/cash-cli-2.0.8.tgz
description :
	 Exchange Currency Rates using your terminal
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
