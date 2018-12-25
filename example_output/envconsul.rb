name :
	 Envconsul
homepage :
	 https://github.com/hashicorp/envconsul
url :
	 https://github.com/hashicorp/envconsul/archive/v0.7.3.tar.gz
description :
	 Launch process with environment variables from Consul and Vault
build_deps :
	 go
link_deps :
	 consul
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/hashicorp/envconsul").install buildpath.children
	 cd "src/github.com/hashicorp/envconsul" do
	 system "go", "build", "-o", bin/"envconsul"
	 prefix.install_metafiles
	 end
