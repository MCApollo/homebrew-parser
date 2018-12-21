name :
	 Minica
homepage :
	 https://github.com/jsha/minica
url :
	 https://github.com/jsha/minica/archive/v1.0.1.tar.gz
description :
	 Small, simple certificate authority
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/jsha").mkpath
	 ln_s buildpath, buildpath/"src/github.com/jsha/minica"
	 system "go", "build", "-o", bin/"minica", "github.com/jsha/minica"
