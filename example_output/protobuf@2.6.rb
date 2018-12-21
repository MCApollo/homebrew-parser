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
conflicts :
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
