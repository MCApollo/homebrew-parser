name :
	 Zola
homepage :
	 https://www.getzola.org/
url :
	 https://github.com/getzola/zola/archive/v0.5.1.tar.gz
description :
	 Fast static site generator in a single binary with everything built-in
build_deps :
	 cmake
	 rust
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
	 bash_completion.install "completions/zola.bash"
	 zsh_completion.install "completions/_zola"
	 fish_completion.install "completions/zola.fish"
