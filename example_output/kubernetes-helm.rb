name :
	 KubernetesHelm
homepage :
	 https://helm.sh/
url :
	 https://github.com/helm/helm.git
description :
	 The Kubernetes package manager
build_deps :
	 glide
	 go
	 mercurial
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 arch = MacOS.prefer_64_bit? ? "amd64" : "x86"
	 ENV["TARGETS"] = "darwin/#{arch}"
	 dir = buildpath/"src/k8s.io/helm"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 system "make", "bootstrap"
	 system "make", "build"
	 bin.install "bin/helm"
	 bin.install "bin/tiller"
	 man1.install Dir["docs/man/man1/*"]
	 output = Utils.popen_read("SHELL=bash #{bin}/helm completion bash")
	 (bash_completion/"helm").write output
	 output = Utils.popen_read("SHELL=zsh #{bin}/helm completion zsh")
	 (zsh_completion/"_helm").write output
	 prefix.install_metafiles
