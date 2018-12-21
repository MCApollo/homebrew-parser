name :
	 Wiki
homepage :
	 https://github.com/walle/wiki
url :
	 https://github.com/walle/wiki/archive/1.4.0.tar.gz
description :
	 Fetch summaries from MediaWiki wikis, like Wikipedia
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 wikipath = buildpath/"src/github.com/walle/wiki"
	 wikipath.install Dir["{*,.git}"]
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd "src/github.com/walle/wiki" do
	 system "go", "build", "-o", "build/wiki", "cmd/wiki/main.go"
	 bin.install "build/wiki"
	 man1.install "_doc/wiki.1"
	 prefix.install_metafiles
