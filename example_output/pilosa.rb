name :
	 Pilosa
homepage :
	 https://www.pilosa.com
url :
	 https://github.com/pilosa/pilosa/archive/v1.1.0.tar.gz
description :
	 Distributed bitmap index that queries across data sets
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/pilosa/pilosa").install buildpath.children
	 cd "src/github.com/pilosa/pilosa" do
	 system "make", "build", "FLAGS=-o #{bin}/pilosa", "VERSION=v#{version}"
	 prefix.install_metafiles
