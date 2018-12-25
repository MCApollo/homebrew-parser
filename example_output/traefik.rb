name :
	 Traefik
homepage :
	 https://traefik.io/
url :
	 https://github.com/containous/traefik/releases/download/v1.7.6/traefik-v1.7.6.src.tar.gz
description :
	 Modern reverse proxy
build_deps :
	 go
	 go-bindata
	 node
	 yarn
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
	 (buildpath/"src/github.com/containous/traefik").install buildpath.children
	 Pathname.new("#{ENV["HOME"]}/.yarnrc").write("ignore-engines true\n")
	 cd "src/github.com/containous/traefik" do
	 cd "webui" do
	 system "yarn", "install"
	 system "yarn", "run", "build"
	 end
	 system "go", "generate"
	 system "go", "build", "-o", bin/"traefik", "./cmd/traefik"
	 prefix.install_metafiles
	 end
