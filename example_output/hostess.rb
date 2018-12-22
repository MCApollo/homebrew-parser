name :
	 Hostess
homepage :
	 https://github.com/cbednarski/hostess
url :
	 https://github.com/cbednarski/hostess/archive/v0.3.0.tar.gz
description :
	 Idempotent command-line utility for managing your /etc/hosts file
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/cbednarski/hostess"
	 dir.install buildpath.children
	 cd dir/"cmd/hostess" do
	 system "go", "install"
	 end
	 bin.install "bin/hostess"
