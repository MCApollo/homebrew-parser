name :
	 Grafana
homepage :
	 https://grafana.com
url :
	 https://github.com/grafana/grafana/archive/v5.4.2.tar.gz
description :
	 Gorgeous metric visualizations and dashboards for timeseries databases
build_deps :
	 go
	 node
	 yarn
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
	 grafana_path = buildpath/"src/github.com/grafana/grafana"
	 grafana_path.install buildpath.children
	 cd grafana_path do
	 system "go", "run", "build.go", "build"
	 system "yarn", "install", "--ignore-engines"
	 args = ["build"]
	 args << "--force" unless build.bottle?
	 system "node_modules/grunt-cli/bin/grunt", *args
	 bin.install "bin/darwin-amd64/grafana-cli"
	 bin.install "bin/darwin-amd64/grafana-server"
	 (etc/"grafana").mkpath
	 cp("conf/sample.ini", "conf/grafana.ini.example")
	 etc.install "conf/sample.ini" => "grafana/grafana.ini"
	 etc.install "conf/grafana.ini.example" => "grafana/grafana.ini.example"
	 pkgshare.install "conf", "public", "tools", "vendor"
	 prefix.install_metafiles
	 end
	 (var/"log/grafana").mkpath
	 (var/"lib/grafana/plugins").mkpath
