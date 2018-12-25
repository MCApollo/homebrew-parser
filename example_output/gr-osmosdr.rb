name :
	 GrOsmosdr
homepage :
	 https://osmocom.org/projects/sdr/wiki/GrOsmoSDR
url :
	 https://cgit.osmocom.org/gr-osmosdr/snapshot/gr-osmosdr-0.1.4.tar.gz
description :
	 Osmocom GNU Radio Blocks
build_deps :
	 cmake
	 swig
link_deps :
	 airspy
	 boost
	 gnuradio
	 hackrf
	 librtlsdr
	 python
	 uhd
optional_deps :
conflicts :
resource :
	 ['Cheetah']
	 ['https://files.pythonhosted.org/packages/source/C/Cheetah/Cheetah-2.4.4.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resource("Cheetah").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
