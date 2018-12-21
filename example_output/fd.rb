name :
	 Fd
homepage :
	 https://github.com/sharkdp/fd
url :
	 https://github.com/sharkdp/fd/archive/v7.2.0.tar.gz
description :
	 Simple, fast and user-friendly alternative to find
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["SHELL_COMPLETIONS_DIR"] = buildpath
	 system "cargo", "install", "--root", prefix, "--path", "."
	 man1.install "doc/fd.1"
	 bash_completion.install "fd.bash"
	 fish_completion.install "fd.fish"
	 zsh_completion.install "_fd"
