name :
	 Kubecfg
homepage :
	 https://github.com/ksonnet/kubecfg
url :
	 https://github.com/ksonnet/kubecfg/archive/v0.9.0.tar.gz
description :
	 Manage complex enterprise Kubernetes environments as code
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/ksonnet/kubecfg").install buildpath.children
	 cd "src/github.com/ksonnet/kubecfg" do
	 system "make", "VERSION=v#{version}"
	 bin.install "kubecfg"
	 pkgshare.install Dir["examples/*"], "testdata/kubecfg_test.jsonnet"
	 prefix.install_metafiles
	 end
	 output = Utils.popen_read("#{bin}/kubecfg completion --shell bash")
	 (bash_completion/"kubecfg").write output
	 output = Utils.popen_read("#{bin}/kubecfg completion --shell zsh")
	 (zsh_completion/"_kubecfg").write output
