name :
	 Hugo
homepage :
	 https://gohugo.io/
url :
	 https://github.com/gohugoio/hugo/archive/v0.52.tar.gz
description :
	 Configurable static site generator
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
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 (buildpath/"src/github.com/gohugoio/hugo").install buildpath.children
	 cd "src/github.com/gohugoio/hugo" do
	 system "go", "build", "-o", bin/"hugo", "-tags", "extended", "main.go"
	 system bin/"hugo", "gen", "autocomplete", "--completionfile=hugo.sh"
	 bash_completion.install "hugo.sh"
	 (Pathname.pwd/"man").mkpath
	 system bin/"hugo", "gen", "man"
	 man1.install Dir["man/*.1"]
	 prefix.install_metafiles
	 end
