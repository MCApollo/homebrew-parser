name :
	 Protobuf
homepage :
	 https://github.com/protocolbuffers/protobuf/
url :
	 https://github.com/protocolbuffers/protobuf.git
description :
	 Protocol buffers (Google's data interchange format)
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 python@2
optional_deps :
	 python
conflicts :
resource :
	 ['six']
	 ['https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend "CXXFLAGS", "-DNDEBUG"
	 ENV.cxx11
	 system "./autogen.sh"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--with-zlib"
	 system "make"
	 system "make", "check" if build.bottle?
	 system "make", "install"
	 doc.install "editors", "examples"
	 Language::Python.each_python(build) do |python, version|
	 resource("six").stage do
	 system python, *Language::Python.setup_install_args(libexec)
	 end
	 chdir "python" do
	 ENV.append_to_cflags "-I#{include}"
	 ENV.append_to_cflags "-L#{lib}"
	 args = Language::Python.setup_install_args libexec
	 args << "--cpp_implementation"
	 system python, *args
	 end
	 site_packages = "lib/python#{version}/site-packages"
	 pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
	 (prefix/site_packages/"homebrew-protobuf.pth").write pth_contents
	 end
