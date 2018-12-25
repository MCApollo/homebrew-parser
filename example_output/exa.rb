name :
	 Exa
homepage :
	 https://the.exa.website
url :
	 https://github.com/ogham/exa/archive/v0.8.0.tar.gz
description :
	 Modern replacement for 'ls'
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
	 system "make", "install", "PREFIX=#{prefix}"
	 bash_completion.install "contrib/completions.bash" => "exa"
	 zsh_completion.install  "contrib/completions.zsh"  => "_exa"
	 fish_completion.install "contrib/completions.fish" => "exa.fish"
