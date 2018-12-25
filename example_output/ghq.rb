name :
	 Ghq
homepage :
	 https://github.com/motemen/ghq
url :
	 https://github.com/motemen/ghq/archive/v0.8.0.tar.gz
description :
	 Remote repository management made easy
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir_p buildpath/"src/github.com/motemen/"
	 ln_s buildpath, buildpath/"src/github.com/motemen/ghq"
	 ENV["GOPATH"] = buildpath
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-ldflags", "-X main.Version=#{version}",
	 "-o", bin/"ghq"
	 zsh_completion.install "zsh/_ghq" if build.with? "completions"
