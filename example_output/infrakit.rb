name :
	 Infrakit
homepage :
	 https://github.com/docker/infrakit
url :
	 https://github.com/docker/infrakit.git
description :
	 Toolkit for creating and managing declarative infrastructure
build_deps :
	 go
	 libvirt
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
	 (buildpath/"src/github.com/docker/infrakit").install buildpath.children
	 cd "src/github.com/docker/infrakit" do
	 system "make", "cli"
	 bin.install "build/infrakit"
	 prefix.install_metafiles
	 end
