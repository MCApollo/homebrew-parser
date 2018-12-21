name :
	 Webpack
homepage :
	 https://webpack.js.org/
url :
	 https://registry.npmjs.org/webpack/-/webpack-4.27.1.tgz
description :
	 Bundler for JavaScript and friends
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"node_modules/webpack").install Dir["*"]
	 buildpath.install resource("webpack-cli")
	 pkg_json = JSON.parse(IO.read("package.json"))
	 pkg_json["dependencies"]["webpack"] = version
	 pkg_json["bundledDependencies"] = ["webpack"]
	 IO.write("package.json", JSON.pretty_generate(pkg_json))
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink libexec/"bin/webpack-cli"
	 bin.install_symlink libexec/"bin/webpack-cli" => "webpack"
