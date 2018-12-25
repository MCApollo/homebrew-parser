name :
	 FregeRepl
homepage :
	 https://github.com/Frege/frege-repl
url :
	 https://github.com/Frege/frege-repl/releases/download/1.4-SNAPSHOT/frege-repl-1.4-SNAPSHOT.zip
description :
	 REPL (read-eval-print loop) for Frege
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
	 rm_f Dir["bin/*.bat"]
	 libexec.install "bin", "lib"
	 bin.install_symlink "#{libexec}/bin/frege-repl"
