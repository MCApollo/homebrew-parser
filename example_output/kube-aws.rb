name :
	 KubeAws
homepage :
	 https://coreos.com/kubernetes/docs/latest/kubernetes-on-aws.html
url :
	 https://github.com/kubernetes-incubator/kube-aws.git
description :
	 CoreOS Kubernetes on AWS
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/kubernetes-incubator/kube-aws"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 system "make", "OUTPUT_PATH=#{bin}/kube-aws"
	 prefix.install_metafiles
