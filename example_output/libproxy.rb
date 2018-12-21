name :
	 Libproxy
homepage :
	 https://libproxy.github.io/libproxy/
url :
	 https://github.com/libproxy/libproxy/archive/0.4.15.tar.gz
description :
	 Library that provides automatic proxy configuration management
build_deps :
	 cmake
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 ..
	 -DPYTHON3_SITEPKG_DIR=#{lib}/python2.7/site-packages
	 -DWITH_PERL=OFF
	 -DWITH_PYTHON2=OFF
	 ]
	 mkdir "build" do
	 system "cmake", *args
	 system "make", "install"
