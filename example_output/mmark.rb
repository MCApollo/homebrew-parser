name :
	 Mmark
homepage :
	 https://mmark.nl/
url :
	 https://github.com/mmarkdown/mmark/archive/v2.0.7.tar.gz
description :
	 Powerful markdown processor in Go geared towards the IETF
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/mmarkdown/"
	 ln_sf buildpath, buildpath/"src/github.com/mmarkdown/mmark"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"mmark"
	 man1.install "mmark.1"
	 doc.install "Syntax.md"
