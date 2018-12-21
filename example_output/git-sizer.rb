name :
	 GitSizer
homepage :
	 https://github.com/github/git-sizer
url :
	 https://github.com/github/git-sizer/archive/v1.3.0.tar.gz
description :
	 Compute various size metrics for a Git repository
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/github/git-sizer").install buildpath.children
	 cd "src/github.com/github/git-sizer" do
	 system "go", "build", "-o", bin/"git-sizer"
	 prefix.install_metafiles
