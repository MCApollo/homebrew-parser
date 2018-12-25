name :
	 WakatimeCli
homepage :
	 https://wakatime.com/
url :
	 https://files.pythonhosted.org/packages/04/db/9917533f8fd503f636f8c5655d9055f2fbef6f90a12a0210b92994f6f823/wakatime-10.4.1.tar.gz
description :
	 Command-line interface to the WakaTime api
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV["PYTHONPATH"] = libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
