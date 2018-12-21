name :
	 Pumba
homepage :
	 https://github.com/alexei-led/pumba
url :
	 https://github.com/alexei-led/pumba/archive/0.6.2.tar.gz
description :
	 Chaos testing tool for Docker
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/alexei-led/pumba").install buildpath.children
	 cd "src/github.com/alexei-led/pumba" do
	 system "go", "build", "-o", bin/"pumba", "-ldflags",
	 "-X main.Version=#{version}", "./cmd"
	 prefix.install_metafiles
