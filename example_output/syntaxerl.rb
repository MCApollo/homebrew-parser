name :
	 Syntaxerl
homepage :
	 https://github.com/ten0s/syntaxerl
url :
	 https://github.com/ten0s/syntaxerl/archive/0.14.0.tar.gz
description :
	 Syntax checker for Erlang code and config files
build_deps :
link_deps :
	 erlang
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "_build/default/bin/syntaxerl"
