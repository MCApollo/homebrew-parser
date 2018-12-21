name :
	 LeanCli
homepage :
	 https://github.com/leancloud/lean-cli
url :
	 https://github.com/leancloud/lean-cli/archive/v0.20.0.tar.gz
description :
	 Command-line tool to develop and manage LeanCloud apps
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 build_from = build.head? ? "homebrew-head" : "homebrew"
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/leancloud/"
	 ln_s buildpath, buildpath/"src/github.com/leancloud/lean-cli"
	 system "go", "build", "-o", bin/"lean",
	 "-ldflags", "-X main.pkgType=#{build_from}",
	 "github.com/leancloud/lean-cli/lean"
	 bash_completion.install "misc/lean-bash-completion" => "lean"
	 zsh_completion.install "misc/lean-zsh-completion" => "_lean"
