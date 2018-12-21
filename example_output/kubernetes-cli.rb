name :
	 KubernetesCli
homepage :
	 https://kubernetes.io/
url :
	 https://github.com/kubernetes/kubernetes.git
description :
	 Kubernetes command-line interface
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 arch = MacOS.prefer_64_bit? ? "amd64" : "x86"
	 dir = buildpath/"src/k8s.io/kubernetes"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 ENV.deparallelize { system "make", "generated_files" }
	 system "make", "kubectl"
	 bin.install "_output/local/bin/darwin/#{arch}/kubectl"
	 output = Utils.popen_read("#{bin}/kubectl completion bash")
	 (bash_completion/"kubectl").write output
	 output = Utils.popen_read("#{bin}/kubectl completion zsh")
	 (zsh_completion/"_kubectl").write output
	 prefix.install_metafiles
	 system "hack/generate-docs.sh"
	 man1.install Dir["docs/man/man1/*.1"]
