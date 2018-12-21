name :
	 Grv
homepage :
	 https://github.com/rgburke/grv
url :
	 https://github.com/rgburke/grv/releases/download/v0.3.0/grv-0.3.0-src.tar.gz
description :
	 Terminal interface for viewing git repositories
build_deps :
	 cmake
	 go
	 pkg-config
link_deps :
	 ncurses
	 readline
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 path = buildpath/"src/github.com/rgburke/grv"
	 path.install buildpath.children
	 cd path do
	 system "make", "build-only"
	 bin.install "grv"
	 prefix.install_metafiles
