name :
	 DockerGen
homepage :
	 https://github.com/jwilder/docker-gen
url :
	 https://github.com/jwilder/docker-gen/archive/0.7.4.tar.gz
description :
	 Generate files from docker container metadata
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
	 (buildpath/"src/github.com/jwilder/docker-gen").install buildpath.children
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd "src/github.com/robfig/glock" do
	 system "go", "install"
	 end
	 cd "src/github.com/jwilder/docker-gen" do
	 system buildpath/"bin/glock", "sync", "github.com/jwilder/docker-gen"
	 system "go", "build", "-ldflags", "-X main.buildVersion=#{version}", "-o",
	 bin/"docker-gen", "./cmd/docker-gen"
	 prefix.install_metafiles
	 end
