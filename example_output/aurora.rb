name :
	 Aurora
homepage :
	 https://xuri.me/aurora
url :
	 https://github.com/xuri/aurora/archive/2.1.tar.gz
description :
	 Beanstalkd queue server console
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 Language::Go.stage_deps resources, buildpath/"src"
	 (buildpath/"src/github.com/xuri").mkpath
	 ln_s buildpath, "src/github.com/xuri/aurora"
	 system "go", "build", "-o", bin/"aurora"
