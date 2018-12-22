name :
	 Fn
homepage :
	 https://fnproject.io
url :
	 https://github.com/fnproject/cli/archive/0.5.36.tar.gz
description :
	 Command-line tool for the fn project
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/fnproject/cli"
	 dir.install Dir["*"]
	 cd dir do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", "#{bin}/fn"
	 prefix.install_metafiles
	 end
