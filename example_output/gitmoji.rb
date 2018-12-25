name :
	 Gitmoji
homepage :
	 https://gitmoji.carloscuesta.me
url :
	 https://registry.npmjs.org/gitmoji-cli/-/gitmoji-cli-1.9.2.tgz
description :
	 Emoji guide for your commit messages
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
