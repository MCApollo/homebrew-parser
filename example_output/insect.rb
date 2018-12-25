name :
	 Insect
homepage :
	 https://insect.sh/
url :
	 https://registry.npmjs.org/insect/-/insect-5.0.0.tgz
description :
	 High precision scientific calculator with support for physical units
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
