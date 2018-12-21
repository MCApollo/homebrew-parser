name :
	 ThePlatinumSearcher
homepage :
	 https://github.com/monochromegane/the_platinum_searcher
url :
	 https://github.com/monochromegane/the_platinum_searcher/archive/v2.2.0.tar.gz
description :
	 Multi-platform code-search similar to ack and ag
build_deps :
	 go
	 godep
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/monochromegane/the_platinum_searcher"
	 dir.install buildpath.children
	 cd dir do
	 system "godep", "restore"
	 system "go", "build", "-o", bin/"pt", ".../cmd/pt"
	 prefix.install_metafiles
