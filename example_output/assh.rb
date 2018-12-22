name :
	 Assh
homepage :
	 https://github.com/moul/advanced-ssh-config
url :
	 https://github.com/moul/advanced-ssh-config/archive/v2.8.0.tar.gz
description :
	 Advanced SSH config - Regex, aliases, gateways, includes and dynamic hosts
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/moul/advanced-ssh-config").install Dir["*"]
	 cd "src/github.com/moul/advanced-ssh-config/cmd/assh" do
	 system "go", "build", "-o", bin/"assh"
	 prefix.install_metafiles
	 end
