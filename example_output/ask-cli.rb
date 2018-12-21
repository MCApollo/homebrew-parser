name :
	 AskCli
homepage :
	 https://www.npmjs.com/package/ask-cli
url :
	 https://registry.npmjs.org/ask-cli/-/ask-cli-1.4.1.tgz
description :
	 CLI tool for Alexa Skill Kit
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
