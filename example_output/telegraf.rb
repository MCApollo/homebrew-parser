name :
	 Telegraf
homepage :
	 https://influxdata.com
url :
	 https://github.com/influxdata/telegraf/archive/1.9.1.tar.gz
description :
	 Server-level metric gathering agent for InfluxDB
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/influxdata/telegraf"
	 dir.install buildpath.children
	 cd dir do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "install", "-ldflags", "-X main.version=#{version}", "./..."
	 prefix.install_metafiles
	 (etc/"telegraf.d").mkpath
