name :
	 Dashing
homepage :
	 https://github.com/technosophos/dashing
url :
	 https://github.com/technosophos/dashing/archive/0.3.0.tar.gz
description :
	 Generate Dash documentation from HTML files
build_deps :
	 glide
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 ['ruby_docs_tarball']
	 ['https://ruby-doc.org/downloads/ruby_2_5_0_core_rdocs.tgz']
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 (buildpath/"src/github.com/technosophos/dashing").install buildpath.children
	 cd "src/github.com/technosophos/dashing" do
	 system "glide", "install"
	 system "go", "build", "-o", bin/"dashing", "-ldflags",
	 "-X main.version=#{version}"
	 prefix.install_metafiles
	 end
