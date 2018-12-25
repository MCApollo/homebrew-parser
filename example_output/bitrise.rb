name :
	 Bitrise
homepage :
	 https://github.com/bitrise-io/bitrise
url :
	 https://github.com/bitrise-io/bitrise/archive/1.25.0.tar.gz
description :
	 Command-line automation tool
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
	 bitrise_go_path = buildpath/"src/github.com/bitrise-io/bitrise"
	 bitrise_go_path.install Dir["*"]
	 cd bitrise_go_path do
	 prefix.install_metafiles
	 system "go", "build", "-o", bin/"bitrise"
	 end
