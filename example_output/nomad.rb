name :
	 Nomad
homepage :
	 https://www.nomadproject.io
url :
	 https://github.com/hashicorp/nomad/archive/v0.8.6.tar.gz
description :
	 Distributed, Highly Available, Datacenter-Aware Scheduler
build_deps :
	 go@1.10
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
	 (buildpath/"src/github.com/hashicorp/nomad").install buildpath.children
	 cd "src/github.com/hashicorp/nomad" do
	 system "go", "build", "-tags", "ui", "-o", bin/"nomad"
	 prefix.install_metafiles
	 end
