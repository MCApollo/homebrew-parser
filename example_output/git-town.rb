name :
	 GitTown
homepage :
	 https://www.git-town.com/
url :
	 https://github.com/Originate/git-town/archive/v7.2.0.tar.gz
description :
	 High-level command-line interface for Git
build_deps :
	 go
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/Originate").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/Originate/git-town"
	 system "go", "build", "-o", bin/"git-town"
