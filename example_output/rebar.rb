name :
	 Rebar
homepage :
	 https://github.com/rebar/rebar
url :
	 https://github.com/rebar/rebar/archive/2.6.4.tar.gz
description :
	 Erlang build tool
build_deps :
link_deps :
	 erlang
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 bin.install "rebar"
	 bash_completion.install "priv/shell-completion/bash/rebar"
	 zsh_completion.install "priv/shell-completion/zsh/_rebar" => "_rebar"
	 fish_completion.install "priv/shell-completion/fish/rebar.fish"
