name :
	 Kompose
homepage :
	 https://kompose.io/
url :
	 https://github.com/kubernetes/kompose/archive/v1.17.0.tar.gz
description :
	 Tool to move from `docker-compose` to Kubernetes
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/kubernetes"
	 ln_s buildpath, buildpath/"src/github.com/kubernetes/kompose"
	 system "make", "bin"
	 bin.install "kompose"
	 output = Utils.popen_read("#{bin}/kompose completion bash")
	 (bash_completion/"kompose").write output
	 output = Utils.popen_read("#{bin}/kompose completion zsh")
	 (zsh_completion/"_kompose").write output
