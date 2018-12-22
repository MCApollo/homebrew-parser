name :
	 Cayley
homepage :
	 https://github.com/cayleygraph/cayley
url :
	 https://github.com/cayleygraph/cayley/archive/v0.7.5.tar.gz
description :
	 Graph database inspired by Freebase and Knowledge Graph
build_deps :
	 bazaar
	 dep
	 go
	 mercurial
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/cayleygraph/cayley").install buildpath.children
	 cd "src/github.com/cayleygraph/cayley" do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", bin/"cayley", "-ldflags",
	 "-X main.Version=#{version}", ".../cmd/cayley"
	 inreplace "cayley_example.yml", "./cayley.db", var/"cayley/cayley.db"
	 etc.install "cayley_example.yml" => "cayley.yml"
	 (pkgshare/"assets").install "docs", "static", "templates"
	 system "gzip", "-d", "data/30kmoviedata.nq.gz"
	 (pkgshare/"samples").install "data/testdata.nq", "data/30kmoviedata.nq"
	 end
	 unless File.exist? var/"cayley"
	 (var/"cayley").mkpath
	 system bin/"cayley", "init", "--config=#{etc}/cayley.yml"
