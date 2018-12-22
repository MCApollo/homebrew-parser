name :
	 BoostPythonAT159
homepage :
	 https://www.boost.org
url :
	 https://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2
description :
	 C++ library for C++/Python interoperability
build_deps :
link_deps :
	 python@2
	 python
	 boost@1.59
	 boost@1.59
conflicts :
patches :
EOF_patch :
install :
	 inreplace "boost/python/data_members.hpp",
	 "
	 "
	 args = ["--prefix=#{prefix}",
	 "--libdir=#{lib}",
	 "-d2",
	 "-j#{ENV.make_jobs}",
	 "--layout=tagged",
	 "--user-config=user-config.jam",
	 "threading=multi,single",
	 "link=shared,static"]
	 if build.cxx11?
	 args << "cxxflags=-std=c++11"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 elsif Tab.for_name("boost159").cxx11?
	 odie "boost159 was built in C++11 mode so boost-python159 must be built with --c++11."
	 end
	 inreplace "bootstrap.sh", "using python", "#using python"
	 Language::Python.each_python(build) do |python, version|
	 py_prefix = `#{python} -c "from __future__ import print_function; import sys; print(sys.prefix)"`.strip
	 py_include = `#{python} -c "from __future__ import print_function; import distutils.sysconfig; print(distutils.sysconfig.get_python_inc(True))"`.strip
	 open("user-config.jam", "w") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
	 file.write <<~EOS
	 using python : #{version}
	 : #{python}
	 : #{py_include}
	 : #{py_prefix}/lib ;
	 EOS
	 end
	 system "./bootstrap.sh", "--prefix=#{prefix}", "--libdir=#{lib}", "--with-libraries=python",
	 "--with-python=#{python}", "--with-python-root=#{py_prefix}"
	 system "./b2", "--build-dir=build-#{python}", "--stagedir=stage-#{python}",
	 "python=#{version}", *args
	 end
	 lib.install Dir["stage-python3/lib/*py*"] if build.with?("python")
	 lib.install Dir["stage-python2.7/lib/*py*"] if build.with?("python@2")
	 doc.install Dir["libs/python/doc/*"]
