name :
	 Prettier
homepage :
	 https://prettier.io/
url :
	 https://registry.npmjs.org/prettier/-/prettier-1.15.3.tgz
description :
	 Code formatter for JavaScript, CSS, JSON, GraphQL, Markdown, YAML
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
