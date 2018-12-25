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
optional_deps :
	 jack
	 pygtk
	 sdl
	 wxpython
conflicts :
resource :
	 ['Markdown', 'Cheetah', 'lxml', 'MarkupSafe', 'Mako', 'six', 'cppzmq', 'cppzmq']
	 ['https://files.pythonhosted.org/packages/b3/73/fc5c850f44af5889192dff783b7b0d8f3fe8d30b65c8e3f78f8f0265fecf/Markdown-2.6.11.tar.gz', 'https://files.pythonhosted.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz', 'https://files.pythonhosted.org/packages/54/a6/43be8cf1cc23e3fa208cab04ba2f9c3b7af0233aab32af6b5089122b44cd/lxml-4.2.3.tar.gz', 'https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz', 'https://files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://raw.githubusercontent.com/zeromq/cppzmq/46fc0572c5e9f09a32a23d6f22fd79b841f77e00/zmq.hpp']
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
