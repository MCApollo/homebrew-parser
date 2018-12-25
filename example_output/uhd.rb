name :
	 Uhd
homepage :
	 https://files.ettus.com/manual/
url :
	 https://github.com/EttusResearch/uhd/archive/v3.13.0.2.tar.gz
description :
	 Hardware driver for all USRP devices
build_deps :
	 cmake
	 doxygen
link_deps :
	 boost
	 libusb
	 python@2
optional_deps :
conflicts :
resource :
	 ['Mako']
	 ['https://files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resource("Mako").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 mkdir "host/build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "test"
	 system "make", "install"
	 end
