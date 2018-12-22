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
conflicts :
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
