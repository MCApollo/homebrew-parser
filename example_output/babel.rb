name :
	 Babel
homepage :
	 https://babeljs.io/
url :
	 https://registry.npmjs.org/@babel/cli/-/cli-7.2.0.tgz
description :
	 Compiler for writing next generation JavaScript
build_deps :
link_deps :
	 node
optional_deps :
conflicts :
resource :
	 ['babel-core']
	 ['https://registry.npmjs.org/@babel/core/-/core-7.2.0.tgz']
patches :
EOF_patch :
install :
	 (buildpath/"node_modules/@babel/core").install resource("babel-core")
	 pkg_json = JSON.parse(IO.read("package.json"))
	 pkg_json["dependencies"]["@babel/core"] = resource("babel-core").version
	 pkg_json["bundledDependencies"] = ["@babel/core"]
	 IO.write("package.json", JSON.pretty_generate(pkg_json))
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
