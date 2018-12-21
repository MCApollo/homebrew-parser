name :
	 Ry
homepage :
	 https://github.com/jayferd/ry
url :
	 https://github.com/jayferd/ry/archive/v0.5.2.tar.gz
description :
	 Ruby virtual env tool
build_deps :
link_deps :
	 bash-completion
	 ruby-build
conflicts :
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 ENV["BASH_COMPLETIONS_DIR"] = etc/"bash_completion.d"
	 ENV["ZSH_COMPLETIONS_DIR"] = share/"zsh/site-functions"
	 system "make", "install"
