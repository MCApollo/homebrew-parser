name :
	 Juju
homepage :
	 https://jujucharms.com/
url :
	 https://launchpad.net/juju/2.4/2.4.7/+download/juju-core_2.4.7.tar.gz
description :
	 DevOps management tool
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 system "go", "build", "github.com/juju/juju/cmd/juju"
	 system "go", "build", "github.com/juju/juju/cmd/plugins/juju-metadata"
	 bin.install "juju", "juju-metadata"
	 bash_completion.install "src/github.com/juju/juju/etc/bash_completion.d/juju"
