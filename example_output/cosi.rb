name :
	 Cosi
homepage :
	 https://github.com/dedis/cosi
url :
	 https://github.com/dedis/cosi/archive/0.8.5.tar.gz
description :
	 Implementation of scalable collective signing
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
	 mkdir_p buildpath/"src/github.com/dedis"
	 ln_s buildpath, buildpath/"src/github.com/dedis/cosi"
	 ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", "cosi"
	 prefix.install "dedis_group.toml"
	 bin.install "cosi"
