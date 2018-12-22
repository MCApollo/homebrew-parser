name :
	 Hcloud
homepage :
	 https://github.com/hetznercloud/cli
url :
	 https://github.com/hetznercloud/cli/archive/v1.10.0.tar.gz
description :
	 Command-line interface for Hetzner Cloud
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 (buildpath/"src/github.com/hetznercloud/cli").install buildpath.children
	 cd "src/github.com/hetznercloud/cli" do
	 ldflags = "-w -X github.com/hetznercloud/cli/cli.Version=v#{version}"
	 system "go", "build", "-o", bin/"hcloud", "-ldflags", ldflags,
	 "./cmd/hcloud"
	 prefix.install_metafiles
	 end
	 output = Utils.popen_read("#{bin}/hcloud completion bash")
	 (bash_completion/"hcloud").write output
	 output = Utils.popen_read("#{bin}/hcloud completion zsh")
	 (zsh_completion/"_hcloud").write output
