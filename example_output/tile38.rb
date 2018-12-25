name :
	 Tile38
homepage :
	 https://tile38.com/
url :
	 https://github.com/tidwall/tile38/archive/1.14.4.tar.gz
description :
	 In-memory geolocation data store, spatial index, and realtime geofence
build_deps :
	 go
	 godep
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
	 system "make"
	 bin.install "tile38-cli", "tile38-server"
	 datadir.mkpath
