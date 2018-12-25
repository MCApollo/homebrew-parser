name :
	 Gauge
homepage :
	 https://getgauge.io
url :
	 https://github.com/getgauge/gauge/archive/v1.0.3.tar.gz
description :
	 Test automation tool that supports executable documentation
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
	 ENV["GOROOT"] = Formula["go"].opt_libexec
	 dir = buildpath/"src/github.com/getgauge/gauge"
	 dir.install buildpath.children
	 ln_s buildpath/"src", dir
	 cd dir do
	 system "go", "run", "build/make.go"
	 system "go", "run", "build/make.go", "--install", "--prefix", prefix
	 end
