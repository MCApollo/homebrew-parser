name :
	 Hivemind
homepage :
	 https://github.com/DarthSim/hivemind
url :
	 https://github.com/DarthSim/hivemind/archive/v1.0.4.tar.gz
description :
	 The mind to rule processes of your development environment
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
	 (buildpath/"src/github.com/DarthSim/hivemind/").install Dir["*"]
	 system "go", "build", "-o", "#{bin}/hivemind", "-v", "github.com/DarthSim/hivemind/"
