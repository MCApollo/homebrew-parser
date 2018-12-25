name :
	 Scw
homepage :
	 https://github.com/scaleway/scaleway-cli
url :
	 https://github.com/scaleway/scaleway-cli/archive/v1.17.tar.gz
description :
	 Manage BareMetal Servers from command-line (as easily as with Docker)
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
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = buildpath
	 (buildpath/"src/github.com/scaleway/scaleway-cli").install Dir["*"]
	 system "go", "build", "-o", "#{bin}/scw", "-v", "-ldflags",
	 "-X github.com/scaleway/scaleway-cli/pkg/scwversion.GITCOMMIT=homebrew",
	 "github.com/scaleway/scaleway-cli/cmd/scw/"
	 bash_completion.install "src/github.com/scaleway/scaleway-cli/contrib/completion/bash/scw.bash"
	 zsh_completion.install "src/github.com/scaleway/scaleway-cli/contrib/completion/zsh/_scw"
