name :
	 HttpServer
homepage :
	 https://github.com/indexzero/http-server
url :
	 https://registry.npmjs.org/http-server/-/http-server-0.11.1.tgz
description :
	 Simple zero-configuration command-line HTTP server
build_deps :
link_deps :
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
