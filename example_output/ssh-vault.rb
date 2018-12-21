name :
	 SshVault
homepage :
	 https://ssh-vault.com/
url :
	 https://github.com/ssh-vault/ssh-vault.git
description :
	 Encrypt/decrypt using SSH keys
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/ssh-vault/ssh-vault").install buildpath.children
	 cd "src/github.com/ssh-vault/ssh-vault" do
	 system "dep", "ensure", "-vendor-only"
	 ldflags = "-s -w -X main.version=#{version}"
	 system "go", "build", "-ldflags", ldflags, "-o", "#{bin}/ssh-vault", "cmd/ssh-vault/main.go"
	 prefix.install_metafiles
