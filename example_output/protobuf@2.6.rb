name :
	 ProtobufAT26
homepage :
	 https://github.com/protocolbuffers/protobuf/
url :
	 https://github.com/protocolbuffers/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.bz2
description :
	 Protocol buffers - Google data interchange format
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['six', 'python-dateutil', 'pytz', 'python-gflags', 'google-apputils']
	 ['https://files.pythonhosted.org/packages/16/64/1dc5e5976b17466fd7d712e59cbe9fb1e18bec153109e5ba3ed6c9102f1a/six-1.9.0.tar.gz', 'https://files.pythonhosted.org/packages/62/fe/45044dfa6bfa6ff18ddfe1df85fbf01d333c284b94e8c9a02fe12241c8cf/python-dateutil-2.4.1.tar.bz2', 'https://files.pythonhosted.org/packages/63/15/8cdc183c669ef4c870099848b6fb37f11e5aeb2fa06601d0015ac4201e51/pytz-2014.10.tar.bz2', 'https://files.pythonhosted.org/packages/46/47/12c17c3216c04a85e5ffd9163ad09f0c1661c2cc2ccc0faf70e39cb8dc96/python-gflags-2.0.tar.gz', 'https://files.pythonhosted.org/packages/69/66/a511c428fef8591c5adfa432a257a333e0d14184b6c5d03f1450827f7fe7/google-apputils-0.4.2.tar.gz']
patches :
EOF_patch :
	 diff --git a/src/google/protobuf/descriptor.h b/src/google/protobuf/descriptor.h
	 index 67afc77..504d5fe 100644
	 --- a/src/google/protobuf/descriptor.h
	 +++ b/src/google/protobuf/descriptor.h
	 @@ -59,6 +59,9 @@
	 #include <vector>
	 #include <google/protobuf/stubs/common.h>
	 +#ifdef TYPE_BOOL
	 +#undef TYPE_BOOL
	 +#endif
	 namespace google {
	 namespace protobuf {
install :
	 ENV.prepend "CXXFLAGS", "-DNDEBUG"
	 ENV.cxx11 if build.cxx11?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-zlib"
	 system "make"
	 system "make", "check" if build.bottle?
	 system "make", "install"
	 doc.install "editors", "examples"
	 if build.with? "python@2"
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"homebrew/lib/python2.7/site-packages"
	 %w[six python-dateutil pytz python-gflags google-apputils].each do |package|
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
