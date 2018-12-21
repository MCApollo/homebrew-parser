name :
	 Aubio
homepage :
	 https://aubio.org/
url :
	 https://aubio.org/pub/aubio-0.4.7.tar.bz2
description :
	 Extract annotations from audio signals
build_deps :
	 libtool
	 pkg-config
link_deps :
	 :macos
	 numpy
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 system "python3", "./waf", "configure", "--prefix=#{prefix}"
	 system "python3", "./waf", "build"
	 system "python3", "./waf", "install"
	 system "python3", *Language::Python.setup_install_args(prefix)
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
