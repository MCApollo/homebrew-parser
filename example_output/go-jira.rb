name :
	 GoJira
homepage :
	 https://github.com/Netflix-Skunkworks/go-jira
url :
	 https://github.com/Netflix-Skunkworks/go-jira/archive/v1.0.20.tar.gz
description :
	 Simple jira command-line client in Go
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/gopkg.in/Netflix-Skunkworks/go-jira.v1"
	 dir.install buildpath.children
	 cd dir do
	 system "go", "build", "-o", bin/"jira", "-ldflags", "-w -s", "cmd/jira/main.go"
	 prefix.install_metafiles
