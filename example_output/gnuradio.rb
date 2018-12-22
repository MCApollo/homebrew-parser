name :
	 Gnuradio
homepage :
	 https://gnuradio.org/
url :
	 https://gnuradio.org/releases/gnuradio/gnuradio-3.7.13.4.tar.gz
description :
	 SDK providing the signal processing runtime and processing blocks
build_deps :
	 cmake
	 doxygen
	 pkg-config
	 sphinx-doc
	 swig
link_deps :
	 boost
	 fftw
	 gsl
	 numpy
	 portaudio
	 python@2
	 uhd
	 zeromq
	 jack
	 pygtk
	 sdl
	 wxpython
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", "/System/Library/Frameworks/Python.framework/Versions/2.7/bin"
	 ENV["CHEETAH_INSTALL_WITHOUT_SETUPTOOLS"] = "1"
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 %w[Markdown Cheetah MarkupSafe Mako six].each do |r|
	 resource(r).stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 begin
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 resource("lxml").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 ensure
	 ENV.delete("SDKROOT")
