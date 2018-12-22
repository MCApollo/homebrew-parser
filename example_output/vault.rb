name :
	 Vault
homepage :
	 https://vaultproject.io/
url :
	 https://github.com/hashicorp/vault.git
description :
	 Secures, stores, and tightly controls access to secrets
build_deps :
	 go
	 gox
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 contents = buildpath.children - [buildpath/".brew_home"]
	 (buildpath/"src/github.com/hashicorp/vault").install contents
	 (buildpath/"bin").mkpath
	 cd "src/github.com/hashicorp/vault" do
	 system "make", "dev"
	 bin.install "bin/vault"
	 prefix.install_metafiles
	 end
