name :
	 Bower
homepage :
	 https://bower.io/
url :
	 https://github.com/bower/bower/archive/v1.8.4.tar.gz
description :
	 Package manager for the web
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
