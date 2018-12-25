name :
	 Svgo
homepage :
	 https://github.com/svg/svgo
url :
	 https://github.com/svg/svgo/archive/v1.1.1.tar.gz
description :
	 Nodejs-based tool for optimizing SVG vector graphics files
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
