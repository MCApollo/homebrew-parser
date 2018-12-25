name :
	 Binwalk
homepage :
	 https://github.com/ReFirmLabs/binwalk
url :
	 https://github.com/ReFirmLabs/binwalk/archive/v2.1.1.tar.gz
description :
	 Searches a binary image for embedded files and executable code
build_deps :
	 swig
link_deps :
	 gcc
	 p7zip
	 python
	 ssdeep
	 xz
optional_deps :
conflicts :
resource :
	 ['numpy', 'scipy']
	 ['https://files.pythonhosted.org/packages/45/ba/2a781ebbb0cd7962cc1d12a6b65bd4eff57ffda449fdbbae4726dc05fbc3/numpy-1.15.2.zip', 'https://files.pythonhosted.org/packages/07/76/7e844757b9f3bf5ab9f951ccd3e4a8eed91ab8720b0aac8c2adcc2fdae9f/scipy-1.1.0.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 %w[numpy scipy].each do |r|
	 resource(r).stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
