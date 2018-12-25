name :
	 Overmind
homepage :
	 https://github.com/DarthSim/overmind
url :
	 https://github.com/DarthSim/overmind/archive/v1.2.1.tar.gz
description :
	 Process manager for Procfile-based applications and tmux
build_deps :
	 go
link_deps :
	 tmux
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/DarthSim/overmind").install buildpath.children
	 system "go", "build", "-o", "#{bin}/overmind", "-v", "github.com/DarthSim/overmind"
