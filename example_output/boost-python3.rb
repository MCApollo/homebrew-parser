name :
	 BoostPython3
homepage :
	 https://www.boost.org/
url :
	 https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2
description :
	 C++ library for C++/Python3 interoperability
build_deps :
link_deps :
	 boost
	 python
optional_deps :
conflicts :
resource :
	 ['numpy']
	 ['https://files.pythonhosted.org/packages/d5/6e/f00492653d0fdf6497a181a1c1d46bbea5a2383e7faf4c8ca6d6f3d2581d/numpy-1.14.5.zip']
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}",
	 "--libdir=#{lib}",
	 "-d2",
	 "-j#{ENV.make_jobs}",
	 "--layout=tagged",
	 "--user-config=user-config.jam",
	 "threading=multi,single",
	 "link=shared,static"]
	 args << "cxxflags=-std=c++11"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 inreplace "bootstrap.sh", "using python", "#using python"
	 pyver = Language::Python.major_minor_version "python3"
	 py_prefix = Formula["python3"].opt_frameworks/"Python.framework/Versions/#{pyver}"
	 numpy_site_packages = buildpath/"homebrew-numpy/lib/python#{pyver}/site-packages"
	 numpy_site_packages.mkpath
	 ENV["PYTHONPATH"] = numpy_site_packages
	 resource("numpy").stage do
	 system "python3", *Language::Python.setup_install_args(buildpath/"homebrew-numpy")
	 end
	 (buildpath/"user-config.jam").write <<~EOS
	 using darwin : : #{ENV.cxx} ;
	 using python : #{pyver}
	 : python3
	 : #{py_prefix}/include/python#{pyver}m
	 : #{py_prefix}/lib ;
	 EOS
	 system "./bootstrap.sh", "--prefix=#{prefix}", "--libdir=#{lib}",
	 "--with-libraries=python", "--with-python=python3",
	 "--with-python-root=#{py_prefix}"
	 system "./b2", "--build-dir=build-python3", "--stagedir=stage-python3",
	 "python=#{pyver}", *args
	 lib.install Dir["stage-python3/lib/*py*"]
	 doc.install Dir["libs/python/doc/*"]
