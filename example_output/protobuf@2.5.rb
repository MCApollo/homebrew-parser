name :
	 ProtobufAT25
homepage :
	 https://github.com/protocolbuffers/protobuf
url :
	 https://github.com/protocolbuffers/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.bz2
description :
	 Protocol buffers (Google's data interchange format)
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend "CXXFLAGS", "-DNDEBUG"
	 ENV.cxx11 if build.cxx11?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-zlib"
	 system "make"
	 system "make", "check" if build.bottle?
	 system "make", "install"
	 doc.install "editors", "examples"
	 if build.with? "python@2"
	 chdir "python" do
	 ENV["PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION"] = "cpp"
	 ENV.append_to_cflags "-I#{include}"
	 ENV.append_to_cflags "-L#{lib}"
	 args = Language::Python.setup_install_args libexec
	 system "python", *args
	 end
	 site_packages = "lib/python2.7/site-packages"
	 pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
	 (prefix/site_packages/"homebrew-protobuf.pth").write pth_contents
