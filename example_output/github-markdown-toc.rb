name :
	 GithubMarkdownToc
homepage :
	 https://github.com/ekalinin/github-markdown-toc.go
url :
	 https://github.com/ekalinin/github-markdown-toc.go/archive/1.0.0.tar.gz
description :
	 Easy TOC creation for GitHub README.md (in go)
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GO111MODULE"] = "on"
	 dir = buildpath/"src/github.com/ekalinin/github-markdown-toc.go"
	 dir.install buildpath.children
	 cd dir do
	 system "go", "build", "-o", bin/"gh-md-toc"
	 prefix.install_metafiles
