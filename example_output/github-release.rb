name :
	 GithubRelease
homepage :
	 https://github.com/aktau/github-release
url :
	 https://github.com/aktau/github-release/archive/v0.7.2.tar.gz
description :
	 Create and edit releases on Github (and upload artifacts)
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
	 system "make"
	 bin.install "github-release"
