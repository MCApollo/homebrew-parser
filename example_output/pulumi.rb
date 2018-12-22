name :
	 Pulumi
homepage :
	 https://pulumi.io/
url :
	 https://github.com/pulumi/pulumi.git
description :
	 Cloud native development platform
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/pulumi/pulumi"
	 dir.install buildpath.children
	 cd dir do
	 system "dep", "ensure", "-vendor-only"
	 system "make", "dist"
	 bin.install Dir["#{buildpath}/bin/*"]
	 prefix.install_metafiles
	 output = Utils.popen_read("#{bin}/pulumi gen-completion bash")
	 (bash_completion/"pulumi").write output
	 output = Utils.popen_read("#{bin}/pulumi gen-completion zsh")
	 (zsh_completion/"_pulumi").write output
	 end
