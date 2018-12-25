name :
	 Alexjs
homepage :
	 https://alexjs.com
url :
	 https://github.com/get-alex/alex/archive/7.0.0.tar.gz
description :
	 Catch insensitive, inconsiderate writing
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
