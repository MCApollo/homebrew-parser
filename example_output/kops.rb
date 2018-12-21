name :
	 Kops
homepage :
	 https://github.com/kubernetes/kops
url :
	 https://github.com/kubernetes/kops/archive/1.10.0.tar.gz
description :
	 Production Grade K8s Installation, Upgrades, and Management
build_deps :
	 go
link_deps :
	 kubernetes-cli
conflicts :
patches :
EOF_patch :
install :
	 ENV["VERSION"] = version unless build.head?
	 ENV["GOPATH"] = buildpath
	 kopspath = buildpath/"src/k8s.io/kops"
	 kopspath.install Dir["*"]
	 system "make", "-C", kopspath
	 bin.install("bin/kops")
	 output = Utils.popen_read("#{bin}/kops completion bash")
	 (bash_completion/"kops").write output
	 output = Utils.popen_read("#{bin}/kops completion zsh")
	 (zsh_completion/"_kops").write output
