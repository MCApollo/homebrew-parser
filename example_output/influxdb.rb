name :
	 Influxdb
homepage :
	 https://influxdata.com/time-series-platform/influxdb/
url :
	 https://github.com/influxdata/influxdb.git
description :
	 Time series, events, and metrics database
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 influxdb_path = buildpath/"src/github.com/influxdata/influxdb"
	 influxdb_path.install Dir["*"]
	 revision = `git rev-parse HEAD`.strip
	 version = `git describe --tags`.strip
	 cd influxdb_path do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "install",
	 "-ldflags", "-X main.version=#{version} -X main.commit=#{revision} -X main.branch=master",
	 "./..."
	 end
	 inreplace influxdb_path/"etc/config.sample.toml" do |s|
	 s.gsub! "/var/lib/influxdb/data", "#{var}/influxdb/data"
	 s.gsub! "/var/lib/influxdb/meta", "#{var}/influxdb/meta"
	 s.gsub! "/var/lib/influxdb/wal", "#{var}/influxdb/wal"
	 end
	 bin.install "bin/influxd"
	 bin.install "bin/influx"
	 bin.install "bin/influx_tsm"
	 bin.install "bin/influx_stress"
	 bin.install "bin/influx_inspect"
	 etc.install influxdb_path/"etc/config.sample.toml" => "influxdb.conf"
	 (var/"influxdb/data").mkpath
	 (var/"influxdb/meta").mkpath
	 (var/"influxdb/wal").mkpath
