name :
	 OpenshiftCli
homepage :
	 https://www.openshift.com/
url :
	 https://github.com/openshift/origin.git
description :
	 OpenShift command-line interface tools
build_deps :
	 go
link_deps :
	 socat
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/".git/info/exclude").atomic_write "/.brew_home"
	 system "make", "all", "WHAT=cmd/oc", "GOFLAGS=-v", "OS_OUTPUT_GOPATH=1"
	 bin.install "_output/local/bin/darwin/amd64/oc"
	 bin.install_symlink "oc" => "oadm"
	 bash_completion.install Dir["contrib/completions/bash/*"]
