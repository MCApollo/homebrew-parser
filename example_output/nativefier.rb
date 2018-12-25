name :
	 Nativefier
homepage :
	 https://github.com/jiahaog/nativefier
url :
	 https://registry.npmjs.org/nativefier/-/nativefier-7.6.9.tgz
description :
	 Wrap web apps natively
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
