name :
	 GoAT14
homepage :
	 https://golang.org
url :
	 https://github.com/golang/go.git
description :
	 Go programming environment (1.4)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['gotools']
	 ['https://go.googlesource.com/tools.git']
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 if build.with? "cc-all"
	 targets = [
	 ["linux",   ["386", "amd64", "arm"]],
	 ["freebsd", ["386", "amd64", "arm"]],
	 ["netbsd",  ["386", "amd64", "arm"]],
	 ["openbsd", ["386", "amd64"]],
	 ["windows", ["386", "amd64"]],
	 ["dragonfly", ["386", "amd64"]],
	 ["plan9",   ["386", "amd64"]],
	 ["solaris", ["amd64"]],
	 ["darwin",  ["386", "amd64"]],
	 ]
	 elsif build.with? "cc-common"
	 targets = [
	 ["linux",   ["386", "amd64", "arm"]],
	 ["windows", ["386", "amd64"]],
	 ["darwin",  ["386", "amd64"]],
	 ]
	 else
	 targets = [["darwin", [""]]]
	 end
	 cd "src" do
	 targets.each do |os, archs|
	 archs.each do |arch|
	 ENV["GOROOT_FINAL"] = libexec
	 ENV["GOOS"]         = os
	 ENV["GOARCH"]       = arch
	 ENV["CGO_ENABLED"]  = "0"
	 ohai "Building go for #{arch}-#{os}"
	 system "./make.bash", "--no-clean"
	 end
	 end
	 end
	 (buildpath/"pkg/obj").rmtree
	 libexec.install Dir["*"]
	 (bin/"go").write_env_script(libexec/"bin/go", :PATH => "#{libexec}/bin:$PATH")
	 bin.install_symlink libexec/"bin/gofmt"
	 ENV.prepend_path "PATH", libexec/"bin"
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/golang.org/x/tools").install resource("gotools")
	 cd "src/golang.org/x/tools/cmd/godoc/" do
	 system "go", "build"
	 (libexec/"bin").install "godoc"
	 end
	 bin.install_symlink libexec/"bin/godoc"
	 cd "src/golang.org/x/tools/cmd/vet/" do
	 system "go", "build"
	 (libexec/"pkg/tool/darwin_amd64/").install "vet"
	 end
