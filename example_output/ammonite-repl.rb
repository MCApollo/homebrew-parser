name :
	 AmmoniteRepl
homepage :
	 https://lihaoyi.github.io/Ammonite/#Ammonite-REPL
url :
	 https://github.com/lihaoyi/Ammonite/releases/download/1.5.0/2.12-1.5.0
description :
	 Ammonite is a cleanroom re-implementation of the Scala REPL
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"].shift => "amm"
	 chmod 0555, libexec/"amm"
	 bin.install_symlink libexec/"amm"
