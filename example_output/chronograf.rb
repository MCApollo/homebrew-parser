name :
	 Chronograf
homepage :
	 https://docs.influxdata.com/chronograf/latest/
url :
	 https://github.com/influxdata/chronograf/archive/1.7.5.tar.gz
description :
	 Open source monitoring and visualization UI for the TICK stack
build_deps :
	 go
	 node
	 yarn
link_deps :
	 influxdb
	 kapacitor
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 Language::Node.setup_npm_environment
	 chronograf_path = buildpath/"src/github.com/influxdata/chronograf"
	 chronograf_path.install buildpath.children
	 Pathname.new("#{ENV["HOME"]}/.yarnrc").write("ignore-engines true\n")
	 cd chronograf_path do
	 system "make", "dep"
	 system "make", ".jssrc"
	 system "make", "chronograf"
	 bin.install "chronograf"
	 prefix.install_metafiles
	 end
