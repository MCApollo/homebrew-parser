name :
	 Gost
homepage :
	 https://github.com/wilhelm-murdoch/gost
url :
	 https://github.com/wilhelm-murdoch/gost/archive/1.2.0.tar.gz
description :
	 Simple command-line utility for easily creating Gists for Github
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
	 ENV["GOPATH"] = buildpath
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", "gost"
	 bin.install "gost"
