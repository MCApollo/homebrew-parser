name :
	 Textql
homepage :
	 https://github.com/dinedal/textql
url :
	 https://github.com/dinedal/textql/archive/2.0.3.tar.gz
description :
	 Executes SQL across text files
build_deps :
	 glide
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 (buildpath/"src/github.com/dinedal/textql").install buildpath.children
	 cd "src/github.com/dinedal/textql" do
	 system "glide", "install"
	 system "go", "build", "-ldflags", "-X main.VERSION=#{version}",
	 "-o", bin/"textql", "./textql"
	 man1.install "man/textql.1"
	 prefix.install_metafiles
