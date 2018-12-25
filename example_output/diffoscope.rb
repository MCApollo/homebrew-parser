name :
	 Diffoscope
homepage :
	 https://diffoscope.org
url :
	 https://files.pythonhosted.org/packages/e2/70/b2b40203fc1eb3ae66c7a45a8db77e4e6c3dc086f3b557f42ef4f234afff/diffoscope-105.tar.gz
description :
	 In-depth comparison of files, archives, and directories
build_deps :
link_deps :
	 gnu-tar
	 libarchive
	 libmagic
	 python
optional_deps :
conflicts :
resource :
	 ['libarchive-c', 'progressbar', 'python-magic']
	 ['https://files.pythonhosted.org/packages/b9/2c/c975b3410e148dab00d14471784a743268614e21121e50e4e00b13f38370/libarchive-c-2.8.tar.gz', 'https://files.pythonhosted.org/packages/a3/a6/b8e451f6cff1c99b4747a2f7235aa904d2d49e8e1464e0b798272aa84358/progressbar-2.5.tar.gz', 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-0.4.15.tar.gz']
patches :
EOF_patch :
install :
	 ENV.delete("PYTHONPATH")
	 pyver = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{pyver}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{pyver}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 libarchive = Formula["libarchive"].opt_lib/"libarchive.dylib"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"],
	 :LIBARCHIVE => libarchive)
