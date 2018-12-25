name :
	 SyncthingInotify
homepage :
	 https://github.com/syncthing/syncthing-inotify
url :
	 https://github.com/syncthing/syncthing-inotify/archive/v0.8.7.tar.gz
description :
	 File watcher intended for use with Syncthing
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
	 ENV["GOROOT"] = Formula["go"].opt_libexec
	 dir = buildpath/"src/github.com/syncthing/syncthing-inotify"
	 dir.install buildpath.children
	 cd dir do
	 system "go", "build", "-ldflags", "-w -X main.Version=#{version}"
	 bin.install name
	 prefix.install_metafiles
	 end
