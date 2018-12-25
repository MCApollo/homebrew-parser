name :
	 Urh
homepage :
	 https://github.com/jopohl/urh
url :
	 https://files.pythonhosted.org/packages/81/29/8ffecf5a0d99bef5a4463fd9dbea537e119562737aaac10b1997da135d5d/urh-2.2.3.tar.gz
description :
	 Universal Radio Hacker
build_deps :
	 pkg-config
link_deps :
	 hackrf
	 numpy
	 pyqt
	 python
	 zeromq
optional_deps :
conflicts :
resource :
	 ['Cython', 'psutil', 'pyzmq']
	 ['https://files.pythonhosted.org/packages/d2/12/8ef44cede251b93322e8503fd6e1b25a0249fa498bebec191a5a06adbe51/Cython-0.28.4.tar.gz', 'https://files.pythonhosted.org/packages/51/9e/0f8f5423ce28c9109807024f7bdde776ed0b1161de20b408875de7e030c3/psutil-5.4.6.tar.gz', 'https://files.pythonhosted.org/packages/aa/fd/f2e65a05558ff8b58b71404efc79c2b03cef922667260e1d703896597b93/pyzmq-17.1.0.tar.gz']
patches :
EOF_patch :
install :
	 ENV.delete "PYTHONPATH"
	 inreplace "src/urh/main.py", "GENERATE_UI = True", "GENERATE_UI = False"
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 next if r.name == "Cython"
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 saved_python_path = ENV["PYTHONPATH"]
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"cython/lib/python#{xy}/site-packages"
	 resource("Cython").stage do
	 system "python3", *Language::Python.setup_install_args(buildpath/"cython")
	 end
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => saved_python_path)
