name :
	 Snag
homepage :
	 https://github.com/Tonkpils/snag
url :
	 https://github.com/Tonkpils/snag/archive/v1.2.0.tar.gz
description :
	 Automatic build tool for all your needs
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
	 (buildpath/"src/github.com/Tonkpils/").mkpath
	 ln_s buildpath, buildpath/"src/github.com/Tonkpils/snag"
	 system "go", "build", "-o", bin/"snag", "./src/github.com/Tonkpils/snag"
