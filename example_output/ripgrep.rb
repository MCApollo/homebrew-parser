name :
	 Ripgrep
homepage :
	 https://github.com/BurntSushi/ripgrep
url :
	 https://github.com/BurntSushi/ripgrep/archive/0.10.0.tar.gz
description :
	 Search tool like grep and The Silver Searcher
build_deps :
	 asciidoc
	 docbook-xsl
	 pkg-config
	 rust
link_deps :
	 pcre2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "cargo", "install", "--root", prefix,
	 "--path", ".",
	 "--features", "pcre2"
	 out_dir = Dir["target/release/build/ripgrep-*/out"].first
	 man1.install "#{out_dir}/rg.1"
	 bash_completion.install "#{out_dir}/rg.bash"
	 fish_completion.install "#{out_dir}/rg.fish"
	 zsh_completion.install "complete/_rg"
