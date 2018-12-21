name :
	 Kustomize
homepage :
	 https://github.com/kubernetes-sigs/kustomize
url :
	 https://github.com/kubernetes-sigs/kustomize.git
description :
	 Template-free customization of Kubernetes YAML manifests
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["CGO_ENABLED"] = "0"
	 revision = Utils.popen_read("git", "rev-parse", "HEAD").strip
	 tag = Utils.popen_read("git", "describe", "--tags").strip
	 dir = buildpath/"src/sigs.k8s.io/kustomize"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 ldflags = %W[
	 -s -X sigs.k8s.io/kustomize/pkg/commands.kustomizeVersion=#{tag}
	 -X sigs.k8s.io/kustomize/pkg/commands.gitCommit=#{revision}
	 ]
	 system "go", "install", "-ldflags", ldflags.join(" ")
	 bin.install buildpath/"bin/kustomize"
	 prefix.install_metafiles
