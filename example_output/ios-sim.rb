name :
	 IosSim
homepage :
	 https://github.com/phonegap/ios-sim
url :
	 https://registry.npmjs.org/ios-sim/-/ios-sim-7.0.0.tgz
description :
	 Command-line application launcher for the iOS Simulator
build_deps :
link_deps :
	 :macos
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
