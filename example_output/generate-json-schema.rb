name :
	 GenerateJsonSchema
homepage :
	 https://github.com/Nijikokun/generate-schema
url :
	 https://registry.npmjs.org/generate-schema/-/generate-schema-2.6.0.tgz
description :
	 Generate a JSON Schema from Sample JSON
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
