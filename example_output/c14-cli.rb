name :
	 C14Cli
homepage :
	 https://github.com/online-net/c14-cli
url :
	 https://github.com/online-net/c14-cli/archive/0.3.tar.gz
description :
	 Manage your Online C14 archives from the command-line
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = buildpath
	 (buildpath/"src/github.com/online-net/c14-cli").install Dir["*"]
	 system "go", "build", "-ldflags",
	 "-X  github.com/online-net/c14-cli/pkg/version.GITCOMMIT=homebrew",
	 "-o", bin/"c14", "github.com/online-net/c14-cli/cmd/c14/"
