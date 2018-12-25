name :
	 Prometheus
homepage :
	 https://prometheus.io/
url :
	 https://github.com/prometheus/prometheus/archive/v2.5.0.tar.gz
description :
	 Service monitoring system and time series database
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
	 mkdir_p buildpath/"src/github.com/prometheus"
	 ln_sf buildpath, buildpath/"src/github.com/prometheus/prometheus"
	 system "make", "build"
	 bin.install %w[promtool prometheus]
	 libexec.install %w[consoles console_libraries]
