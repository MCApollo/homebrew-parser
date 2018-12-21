name :
	 Rebar3
homepage :
	 https://github.com/erlang/rebar3
url :
	 https://github.com/erlang/rebar3/archive/3.7.5.tar.gz
description :
	 Erlang build tool
build_deps :
link_deps :
	 erlang
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 bin.install "rebar3"
	 bash_completion.install "priv/shell-completion/bash/rebar3"
	 zsh_completion.install "priv/shell-completion/zsh/_rebar3"
	 fish_completion.install "priv/shell-completion/fish/rebar3.fish"
