name :
	 FirebaseCli
homepage :
	 https://firebase.google.com/docs/cli/
url :
	 https://registry.npmjs.org/firebase-tools/-/firebase-tools-6.1.2.tgz
description :
	 Firebase command-line tools
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
