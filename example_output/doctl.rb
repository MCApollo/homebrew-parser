name :
	 Doctl
homepage :
	 https://github.com/digitalocean/doctl
url :
	 https://github.com/digitalocean/doctl/archive/v1.12.2.tar.gz
description :
	 Command-line tool for DigitalOcean
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/digitalocean/"
	 ln_sf buildpath, buildpath/"src/github.com/digitalocean/doctl"
	 doctl_version = version.to_s.split(/\./)
	 base_flag = "-X github.com/digitalocean/doctl"
	 ldflags = %W[
	 #{base_flag}.Major=#{doctl_version[0]}
	 #{base_flag}.Minor=#{doctl_version[1]}
	 #{base_flag}.Patch=#{doctl_version[2]}
	 #{base_flag}.Label=release
	 ].join(" ")
	 system "go", "build", "-ldflags", ldflags, "github.com/digitalocean/doctl/cmd/doctl"
	 bin.install "doctl"
	 (bash_completion/"doctl").write `#{bin}/doctl completion bash`
	 (zsh_completion/"doctl").write `#{bin}/doctl completion zsh`
