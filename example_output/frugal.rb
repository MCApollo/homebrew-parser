name :
	 Frugal
homepage :
	 https://github.com/Workiva/frugal
url :
	 https://github.com/Workiva/frugal/archive/2.25.2.tar.gz
description :
	 Cross language code generator for creating scalable microservices
build_deps :
	 glide
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/Workiva/frugal").install buildpath.children
	 cd "src/github.com/Workiva/frugal" do
	 system "glide", "install"
	 system "go", "build", "-o", bin/"frugal"
	 prefix.install_metafiles
