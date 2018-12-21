name :
	 ProtobufAT31
homepage :
	 https://github.com/protocolbuffers/protobuf/
url :
	 https://github.com/protocolbuffers/protobuf/archive/v3.1.0.tar.gz
description :
	 Protocol buffers (Google's data interchange format)
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend "CXXFLAGS", "-DNDEBUG"
	 ENV.cxx11
	 (buildpath/"gmock").install resource("gmock")
	 system "./autogen.sh"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--with-zlib"
	 system "make"
	 system "make", "check" if build.bottle?
	 system "make", "install"
	 doc.install "editors", "examples"
	 if build.with? "python@2"
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"homebrew/lib/python2.7/site-packages"
	 res = resources.map(&:name).to_set - ["gmock"]
	 res.each do |package|
	 resource(package).stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"homebrew")
