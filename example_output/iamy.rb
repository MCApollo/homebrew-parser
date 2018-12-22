name :
	 Iamy
homepage :
	 https://github.com/99designs/iamy
url :
	 https://github.com/99designs/iamy/archive/v2.2.0.tar.gz
description :
	 AWS IAM import and export tool
build_deps :
	 go
link_deps :
	 awscli
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/99designs/iamy"
	 dir.install buildpath.children
	 cd dir do
	 system "go", "build", "-o", bin/"iamy", "-ldflags",
	 "-X main.Version=v#{version}"
	 prefix.install_metafiles
	 end
