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
	 python
conflicts :
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
