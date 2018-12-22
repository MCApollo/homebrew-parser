name :
	 Nghttp2
homepage :
	 https://nghttp2.org/
url :
	 https://github.com/nghttp2/nghttp2/releases/download/v1.35.1/nghttp2-1.35.1.tar.xz
description :
	 HTTP/2 C Library
build_deps :
	 cunit
	 pkg-config
	 sphinx-doc
link_deps :
	 c-ares
	 jansson
	 jemalloc
	 libev
	 libevent
	 libxml2
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = %W[
	 --prefix=#{prefix}
	 --disable-silent-rules
	 --enable-app
	 --disable-python-bindings
	 ]
	 args << "--disable-threads" if MacOS.version < :el_capitan
	 args << "--with-xml-prefix=/usr" if MacOS.version > :lion
	 system "autoreconf", "-ivf" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 if build.with? "python"
	 pyver = Language::Python.major_minor_version "python3"
	 ENV["PYTHONPATH"] = cythonpath = buildpath/"cython/lib/python#{pyver}/site-packages"
	 cythonpath.mkpath
	 ENV.prepend_create_path "PYTHONPATH", lib/"python#{pyver}/site-packages"
	 resource("Cython").stage do
	 system "python3", *Language::Python.setup_install_args(buildpath/"cython")
	 end
	 cd "python" do
	 system buildpath/"cython/bin/cython", "nghttp2.pyx"
	 system "python3", *Language::Python.setup_install_args(prefix)
	 end
