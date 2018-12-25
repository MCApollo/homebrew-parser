name :
	 FlintChecker
homepage :
	 https://github.com/pengwynn/flint
url :
	 https://github.com/pengwynn/flint/archive/v0.1.0.tar.gz
description :
	 Check your project for common sources of contributor friction
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
	 (buildpath/"src/github.com/pengwynn").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/pengwynn/flint"
	 system "go", "build", "-o", bin/"flint"
