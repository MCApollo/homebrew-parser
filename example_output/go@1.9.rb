name :
	 GoAT19
homepage :
	 https://golang.org
url :
	 https://dl.google.com/go/go1.9.7.src.tar.gz
description :
	 Go programming environment (1.9)
build_deps :
link_deps :
	 :macos
conflicts :
patches :
	 https://github.com/Homebrew/formula-patches/raw/e089e057dbb8aff7d0dc36a6c1933c29dca9c77e/go%401.9/go_19_load_commands.patch
EOF_patch :
install :
	 (buildpath/"gobootstrap").install resource("gobootstrap")
	 ENV["GOROOT_BOOTSTRAP"] = buildpath/"gobootstrap"
	 cd "src" do
	 ENV["GOROOT_FINAL"] = libexec
	 ENV["GOOS"]         = "darwin"
	 system "./make.bash", "--no-clean"
