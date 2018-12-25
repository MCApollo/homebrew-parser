name :
	 Gotags
homepage :
	 https://github.com/jstemmer/gotags
url :
	 https://github.com/jstemmer/gotags/archive/v1.4.1.tar.gz
description :
	 Tag generator for Go, compatible with ctags
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
	 system "go", "build", "-o", "gotags"
	 bin.install "gotags"
