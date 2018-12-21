name :
	 Pyexiv2
homepage :
	 https://launchpad.net/pyexiv2
url :
	 https://launchpad.net/pyexiv2/0.3.x/0.3.2/+download/pyexiv2-0.3.2.tar.bz2
description :
	 Python binding to exiv2 for manipulation of image metadata
build_deps :
	 scons
link_deps :
	 boost
	 boost-python
	 exiv2
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CXXFLAGS", ENV.cppflags
	 ENV.append "CXXFLAGS", "-I#{Formula["boost"].include}"
	 ENV.append "CXXFLAGS", "-I#{Formula["exiv2"].include}"
	 ENV.append "LDFLAGS", "-undefined dynamic_lookup"
	 scons "BOOSTLIB=boost_python27-mt"
	 mv "build/libexiv2python.dylib", "build/libexiv2python.so"
	 (lib+"python2.7/site-packages").install "build/libexiv2python.so", "src/pyexiv2"
	 pkgshare.install "test/data/smiley1.jpg"
