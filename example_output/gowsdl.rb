name :
	 Gowsdl
homepage :
	 https://github.com/hooklift/gowsdl
url :
	 https://github.com/hooklift/gowsdl/archive/v0.3.0.tar.gz
description :
	 WSDL2Go code generation as well as its SOAP proxy
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir_p buildpath/"src/github.com/hooklift"
	 ln_s buildpath, buildpath/"src/github.com/hooklift/gowsdl"
	 ENV["GOPATH"] = buildpath
	 system "make", "build"
	 bin.install "build/gowsdl"
