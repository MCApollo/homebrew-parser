name :
	 Pup
homepage :
	 https://github.com/EricChiang/pup
url :
	 https://github.com/ericchiang/pup/archive/v0.4.0.tar.gz
description :
	 Parse HTML at the command-line
build_deps :
	 go
	 gox
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/ericchiang/pup"
	 dir.install buildpath.children
	 cd dir do
	 arch = MacOS.prefer_64_bit? ? "amd64" : "386"
	 system "gox", "-arch", arch, "-os", "darwin", "./..."
	 bin.install "pup_darwin_#{arch}" => "pup"
