name :
	 Rack
homepage :
	 https://github.com/rackspace/rack
url :
	 https://github.com/rackspace/rack.git
description :
	 CLI for Rackspace
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["TRAVIS_TAG"] = version
	 rackpath = buildpath/"src/github.com/rackspace/rack"
	 rackpath.install Dir["{*,.??*}"]
	 cd rackpath do
	 inreplace "script/build", "go1.5", Utils.popen_read("go version")[/go1\.\d/]
	 ln_s "internal", "vendor"
	 system "script/build", "rack"
	 bin.install "rack"
	 prefix.install_metafiles
