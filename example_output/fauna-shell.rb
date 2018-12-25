name :
	 FaunaShell
homepage :
	 https://fauna.com/
url :
	 https://registry.npmjs.org/fauna-shell/-/fauna-shell-0.9.0.tgz
description :
	 Interactive shell for FaunaDB
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
