name :
	 BitwardenCli
homepage :
	 https://bitwarden.com/
url :
	 https://registry.npmjs.org/@bitwarden/cli/-/cli-1.5.0.tgz
description :
	 Secure and free password manager for all of your devices
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
