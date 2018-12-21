name :
	 Restic
homepage :
	 https://restic.github.io/
url :
	 https://github.com/restic/restic/archive/v0.9.3.tar.gz
description :
	 Fast, efficient and secure backup program
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 system "go", "run", "build.go"
	 mkdir "completions"
	 system "./restic", "generate", "--bash-completion", "completions/restic"
	 system "./restic", "generate", "--zsh-completion", "completions/_restic"
	 mkdir "man"
	 system "./restic", "generate", "--man", "man"
	 bin.install "restic"
	 bash_completion.install "completions/restic"
	 zsh_completion.install "completions/_restic"
	 man1.install Dir["man/*.1"]
