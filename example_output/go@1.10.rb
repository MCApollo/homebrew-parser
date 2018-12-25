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
optional_deps :
conflicts :
resource :
	 ['gotools', 'gobootstrap']
	 ['https://go.googlesource.com/tools.git', 'https://storage.googleapis.com/golang/go1.7.darwin-amd64.tar.gz']
patches :
EOF_patch :
install :
	 (buildpath/"gobootstrap").install resource("gobootstrap")
	 ENV["GOROOT_BOOTSTRAP"] = buildpath/"gobootstrap"
	 cd "src" do
	 ENV["GOROOT_FINAL"] = libexec
	 ENV["GOOS"]         = "darwin"
	 system "./make.bash", "--no-clean"
	 end
	 (buildpath/"pkg/obj").rmtree
	 rm_rf "gobootstrap"
	 libexec.install Dir["*"]
	 bin.install_symlink Dir[libexec/"bin/go*"]
	 system bin/"go", "install", "-race", "std"
	 ENV.prepend_path "PATH", bin
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/golang.org/x/tools").install resource("gotools")
	 cd "src/golang.org/x/tools/cmd/godoc/" do
	 system "go", "build"
	 (libexec/"bin").install "godoc"
	 end
	 bin.install_symlink libexec/"bin/godoc"
