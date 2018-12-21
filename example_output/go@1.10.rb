name :
	 GoAT110
homepage :
	 https://golang.org
url :
	 https://dl.google.com/go/go1.10.7.src.tar.gz
description :
	 Go programming environment (1.10)
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"gobootstrap").install resource("gobootstrap")
	 ENV["GOROOT_BOOTSTRAP"] = buildpath/"gobootstrap"
	 cd "src" do
	 ENV["GOROOT_FINAL"] = libexec
	 ENV["GOOS"]         = "darwin"
	 system "./make.bash", "--no-clean"
