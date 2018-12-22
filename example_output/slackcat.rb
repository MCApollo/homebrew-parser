name :
	 Slackcat
homepage :
	 https://github.com/vektorlab/slackcat
url :
	 https://github.com/vektorlab/slackcat/archive/v1.4.tar.gz
description :
	 Command-line utility for posting snippets to Slack
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/vektorlab/slackcat").install buildpath.children
	 cd "src/github.com/vektorlab/slackcat" do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", bin/"slackcat",
	 "-ldflags", "-X main.version=#{version}"
	 prefix.install_metafiles
	 end
