name :
	 Joplin
homepage :
	 https://joplin.cozic.net/
url :
	 https://registry.npmjs.org/joplin/-/joplin-1.0.116.tgz
description :
	 Note taking and to-do application with synchronisation capabilities
build_deps :
	 python@2
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
