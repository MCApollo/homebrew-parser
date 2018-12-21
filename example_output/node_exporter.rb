name :
	 NodeExporter
homepage :
	 https://prometheus.io/
url :
	 https://github.com/prometheus/node_exporter/archive/v0.16.0.tar.gz
description :
	 Prometheus exporter for machine metrics
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/prometheus").mkpath
	 ln_s buildpath, "src/github.com/prometheus/node_exporter"
	 system "go", "build", "-o", bin/"node_exporter", "-ldflags",
	 "-X github.com/prometheus/node_exporter/vendor/github.com/prometheus/common/version.Version=#{version}",
	 "github.com/prometheus/node_exporter"
