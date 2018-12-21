name :
	 Quicktype
homepage :
	 https://github.com/quicktype/quicktype
url :
	 https://registry.npmjs.org/quicktype/-/quicktype-15.0.160.tgz
description :
	 Generate types and converters from JSON, Schema, and GraphQL
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
