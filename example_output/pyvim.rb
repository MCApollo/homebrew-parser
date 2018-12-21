name :
	 Pyvim
homepage :
	 https://github.com/jonathanslenders/pyvim
url :
	 https://files.pythonhosted.org/packages/96/3f/2fc173e4fec288adc9cd1dd52de15ca2a9947a941ee98d0ea3c678f89cd9/pyvim-2.0.22.tar.gz
description :
	 Pure Python Vim clone
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec)
