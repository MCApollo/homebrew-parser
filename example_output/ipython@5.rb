name :
	 IpythonAT5
homepage :
	 https://ipython.org/
url :
	 https://files.pythonhosted.org/packages/41/a6/2d25314b1f9375639d8f8e0f8052e8cec5df511d3449f22c4f1c2d8cb3c6/ipython-5.8.0.tar.gz
description :
	 Interactive computing in Python
build_deps :
link_deps :
	 python@2
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 ipykernel = resource("ipykernel")
	 (resources - [ipykernel]).each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install libexec/"bin/ipython"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 man1.install libexec/"share/man/man1/ipython.1"
	 ipykernel.stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 kernel_dir = Dir.mktmpdir
	 system libexec/"bin/ipython", "kernel", "install", "--prefix", kernel_dir
	 (share/"jupyter/kernels/python2").install Dir["#{kernel_dir}/share/jupyter/kernels/python2/*"]
	 inreplace share/"jupyter/kernels/python2/kernel.json", "]", <<~EOS.chomp
	 ],
	 "env": {
	 "PYTHONPATH": "#{ENV["PYTHONPATH"]}"
	 }
	 EOS
	 rm_rf etc/"jupyter/kernels/python2"
	 (etc/"jupyter/kernels/python2").install Dir[share/"jupyter/kernels/python2/*"]
