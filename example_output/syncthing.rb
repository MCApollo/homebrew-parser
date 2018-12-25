name :
	 Syncthing
homepage :
	 https://syncthing.net/
url :
	 https://github.com/syncthing/syncthing.git
description :
	 Open source continuous file synchronization application
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
	 (buildpath/"src/github.com/syncthing/syncthing").install buildpath.children
	 ENV.append_path "PATH", buildpath/"bin"
	 cd "src/github.com/syncthing/syncthing" do
	 system "./build.sh", "noupgrade"
	 bin.install "syncthing"
	 man1.install Dir["man/*.1"]
	 man5.install Dir["man/*.5"]
	 man7.install Dir["man/*.7"]
	 prefix.install_metafiles
	 end
