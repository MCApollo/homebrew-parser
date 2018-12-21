name :
	 Fades
homepage :
	 https://fades.readthedocs.org/
url :
	 https://files.pythonhosted.org/packages/27/89/dd5b165986f4064d2a3285461e1a15fb7006793b453a7b2a3b518377b8f2/fades-7.0.tar.gz
description :
	 Automatically handle virtualenvs for python scripts
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 pyver = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{pyver}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
