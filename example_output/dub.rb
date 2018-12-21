name :
	 Dub
homepage :
	 https://code.dlang.org/getting_started
url :
	 https://github.com/dlang/dub/archive/v1.12.1.tar.gz
description :
	 Build tool for D projects
build_deps :
	 dmd
link_deps :
	 pkg-config
conflicts :
patches :
EOF_patch :
install :
	 ENV["GITVER"] = version.to_s
	 system "./build.sh"
	 bin.install "bin/dub"
