name :
	 Fabio
homepage :
	 https://github.com/fabiolb/fabio
url :
	 https://github.com/fabiolb/fabio/archive/v1.5.10.tar.gz
description :
	 Zero-conf load balancing HTTP(S) router
build_deps :
	 go
link_deps :
	 consul
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir_p buildpath/"src/github.com/fabiolb"
	 ln_s buildpath, buildpath/"src/github.com/fabiolb/fabio"
	 ENV["GOPATH"] = buildpath.to_s
	 ENV["GO111MODULE"] = "off"
	 system "go", "install", "github.com/fabiolb/fabio"
	 bin.install "#{buildpath}/bin/fabio"
