name :
	 SsllabsScan
homepage :
	 https://github.com/ssllabs/ssllabs-scan/
url :
	 https://github.com/ssllabs/ssllabs-scan/archive/v1.4.0.tar.gz
description :
	 This tool is a command-line client for the SSL Labs APIs
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
	 system "make", "build"
	 bin.install "ssllabs-scan"
