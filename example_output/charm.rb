name :
	 Charm
homepage :
	 https://github.com/juju/charmstore-client
url :
	 https://github.com/juju/charmstore-client/archive/v2.3.0.tar.gz
description :
	 Tool for managing Juju Charms
build_deps :
	 bazaar
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/juju/charmstore-client"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd("src/github.com/rogpeppe/godeps") { system "go", "install" }
	 cd dir do
	 system "godeps", "-x", "-u", "dependencies.tsv"
	 system "go", "build", "github.com/juju/charmstore-client/cmd/charm"
	 bin.install "charm"
	 prefix.install_metafiles
	 end
