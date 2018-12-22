name :
	 Dnscontrol
homepage :
	 https://github.com/StackExchange/dnscontrol
url :
	 https://github.com/StackExchange/dnscontrol/archive/v0.2.7.tar.gz
description :
	 It is system for maintaining DNS zones
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 srcpath = buildpath/"src/github.com/StackExchange/dnscontrol"
	 srcpath.install buildpath.children
	 cd srcpath do
	 system "go", "build", "-o", bin/"dnscontrol"
	 prefix.install_metafiles
	 end
