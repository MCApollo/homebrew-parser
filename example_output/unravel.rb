name :
	 Unravel
homepage :
	 https://github.com/pesterhazy/unravel
url :
	 https://github.com/pesterhazy/unravel/archive/0.2.2.tar.gz
description :
	 Command-line client for Clojure REPLs
build_deps :
link_deps :
	 lumo
	 node
conflicts :
patches :
EOF_patch :
install :
	 inreplace "package.json", /"lumo-cljs": ".+?",/, ""
	 inreplace "bin/unravel",
	 '"${UNRAVEL_HOME}/node_modules/lumo-cljs/bin/lumo"', "lumo"
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 (bin/"unravel").write_env_script libexec/"bin/unravel",
	 :UNRAVEL_HOME => libexec/"lib/node_modules/unravel-repl"
