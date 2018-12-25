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
optional_deps :
conflicts :
resource :
	 ['appdirs', 'packaging', 'pyparsing', 'six', 'setuptools', 'python-dateutil', 'pytz', 'python-gflags', 'google-apputils', 'gmock']
	 ['https://files.pythonhosted.org/packages/bd/66/0a7f48a0f3fb1d3a4072bceb5bbd78b1a6de4d801fb7135578e7c7b1f563/appdirs-1.4.0.tar.gz', 'https://files.pythonhosted.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/packaging-16.8.tar.gz', 'https://files.pythonhosted.org/packages/38/bb/bf325351dd8ab6eb3c3b7c07c3978f38b2103e2ab48d59726916907cd6fb/pyparsing-2.1.10.tar.gz', 'https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz', 'https://files.pythonhosted.org/packages/64/88/d434873ba1ce02c0ed669f574afeabaeaaeec207929a41b5c1ed947270fc/setuptools-34.1.0.zip', 'https://files.pythonhosted.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz', 'https://files.pythonhosted.org/packages/d0/e1/aca6ef73a7bd322a7fc73fd99631ee3454d4fc67dc2bee463e2adf6bb3d3/pytz-2016.10.tar.bz2', 'https://files.pythonhosted.org/packages/82/9c/7ed91459f01422d90a734afcf30de7df6b701b90a2e7c7a7d01fd580242d/python-gflags-3.1.0.tar.gz', 'https://files.pythonhosted.org/packages/69/66/a511c428fef8591c5adfa432a257a333e0d14184b6c5d03f1450827f7fe7/google-apputils-0.4.2.tar.gz', 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/googlemock/gmock-1.7.0.zip']
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
	 end
	 end
	 touch buildpath/"homebrew/lib/python2.7/site-packages/google/__init__.py"
	 chdir "python" do
	 ENV.append_to_cflags "-I#{include}"
	 ENV.append_to_cflags "-L#{lib}"
	 args = Language::Python.setup_install_args libexec
	 args << "--cpp_implementation"
	 system "python", *args
	 end
	 site_packages = "lib/python2.7/site-packages"
	 pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
	 (prefix/site_packages/"homebrew-protobuf.pth").write pth_contents
	 end
