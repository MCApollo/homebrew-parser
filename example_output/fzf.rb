name :
	 Fzf
homepage :
	 https://github.com/junegunn/fzf
url :
	 https://github.com/junegunn/fzf/archive/0.17.5.tar.gz
description :
	 Command-line fuzzy finder written in Go
build_deps :
	 glide
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GLIDE_HOME"] = buildpath/"glide_home"
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/junegunn").mkpath
	 ln_s buildpath, buildpath/"src/github.com/junegunn/fzf"
	 system "glide", "install"
	 system "go", "build", "-o", bin/"fzf", "-ldflags", "-X main.revision=brew"
	 prefix.install "install", "uninstall"
	 (prefix/"shell").install %w[bash zsh fish].map { |s| "shell/key-bindings.#{s}" }
	 (prefix/"shell").install %w[bash zsh].map { |s| "shell/completion.#{s}" }
	 (prefix/"plugin").install "plugin/fzf.vim"
	 man1.install "man/man1/fzf.1", "man/man1/fzf-tmux.1"
	 bin.install "bin/fzf-tmux"
