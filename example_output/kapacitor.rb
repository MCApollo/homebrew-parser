name :
	 Kapacitor
homepage :
	 https://github.com/influxdata/kapacitor
url :
	 https://github.com/influxdata/kapacitor.git
description :
	 Open source time series data processor
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 kapacitor_path = buildpath/"src/github.com/influxdata/kapacitor"
	 kapacitor_path.install Dir["*"]
	 revision = Utils.popen_read("git rev-parse HEAD").strip
	 version = Utils.popen_read("git describe --tags").strip
	 cd kapacitor_path do
	 system "go", "install",
	 "-ldflags", "-X main.version=#{version} -X main.commit=#{revision}",
	 "./cmd/..."
