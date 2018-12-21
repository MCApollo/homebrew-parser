name :
	 Go
homepage :
	 https://golang.org
url :
	 https://dl.google.com/go/go1.11.4.src.tar.gz
description :
	 Open source programming language to build simple/reliable/efficient software
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
