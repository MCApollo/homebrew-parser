name :
	 Ipython
homepage :
	 https://ipython.org/
url :
	 https://files.pythonhosted.org/packages/42/bb/0ed1fb1d57d697326f9e9b827d9a74b81dee56031ed7c252bc716195ad7a/ipython-7.2.0.tar.gz
description :
	 Interactive computing in Python
build_deps :
link_deps :
	 python
	 zeromq
optional_deps :
conflicts :
resource :
	 ['appnope', 'backcall', 'decorator', 'ipykernel', 'ipython_genutils', 'jedi', 'jupyter_client', 'jupyter_core', 'parso', 'pexpect', 'pickleshare', 'prompt_toolkit', 'ptyprocess', 'Pygments', 'python-dateutil', 'pyzmq', 'simplegeneric', 'six', 'tornado', 'traitlets', 'wcwidth']
	 ['https://files.pythonhosted.org/packages/26/34/0f3a5efac31f27fabce64645f8c609de9d925fe2915304d1a40f544cff0e/appnope-0.1.0.tar.gz', 'https://files.pythonhosted.org/packages/84/71/c8ca4f5bb1e08401b916c68003acf0a0655df935d74d93bf3f3364b310e0/backcall-0.1.0.tar.gz', 'https://files.pythonhosted.org/packages/6f/24/15a229626c775aae5806312f6bf1e2a73785be3402c0acdec5dbddd8c11e/decorator-4.3.0.tar.gz', 'https://files.pythonhosted.org/packages/11/0b/95330660f8cc5d63428b9886c800ea8d68842fd866389cf579acca4915be/ipykernel-5.1.0.tar.gz', 'https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399/ipython_genutils-0.2.0.tar.gz', 'https://files.pythonhosted.org/packages/c1/fd/cba30adcd2a739b1288b9dc87830c28797181492757080294523d03599e6/jedi-0.13.1.tar.gz', 'https://files.pythonhosted.org/packages/4c/df/1e8df7f4de63cc667a7a9aa234539c0419513bf94ac57d36d73b3b434786/jupyter_client-5.2.3.tar.gz', 'https://files.pythonhosted.org/packages/b6/2d/2804f4de3a95583f65e5dcb4d7c8c7183124882323758996e867f47e72af/jupyter_core-4.4.0.tar.gz', 'https://files.pythonhosted.org/packages/46/31/60de7c9cbb97cac56b193a5b61a1fd4d21df84843a570b370ec34781316b/parso-0.3.1.tar.gz', 'https://files.pythonhosted.org/packages/89/43/07d07654ee3e25235d8cea4164cdee0ec39d1fda8e9203156ebe403ffda4/pexpect-4.6.0.tar.gz', 'https://files.pythonhosted.org/packages/d8/b6/df3c1c9b616e9c0edbc4fbab6ddd09df9535849c64ba51fcb6531c32d4d8/pickleshare-0.7.5.tar.gz', 'https://files.pythonhosted.org/packages/d9/a5/4b2dd1a05403e34c3ba0d9c00f237c01967c0a4f59a427c9b241129cdfe4/prompt_toolkit-2.0.7.tar.gz', 'https://files.pythonhosted.org/packages/7d/2d/e4b8733cf79b7309d84c9081a4ab558c89d8c89da5961bf4ddb050ca1ce0/ptyprocess-0.6.0.tar.gz', 'https://files.pythonhosted.org/packages/63/a2/91c31c4831853dedca2a08a0f94d788fc26a48f7281c99a303769ad2721b/Pygments-2.3.0.tar.gz', 'https://files.pythonhosted.org/packages/0e/01/68747933e8d12263d41ce08119620d9a7e5eb72c876a3442257f74490da0/python-dateutil-2.7.5.tar.gz', 'https://files.pythonhosted.org/packages/b9/6a/bc9277b78f5c3236e36b8c16f4d2701a7fd4fa2eb697159d3e0a3a991573/pyzmq-17.1.2.tar.gz', 'https://files.pythonhosted.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/e6/78/6e7b5af12c12bdf38ca9bfe863fcaf53dc10430a312d0324e76c1e5ca426/tornado-5.1.1.tar.gz', 'https://files.pythonhosted.org/packages/a5/98/7f5ef2fe9e9e071813aaf9cb91d1a732e0a68b6c44a32b38cb8e14c3f069/traitlets-4.3.2.tar.gz', 'https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 ipykernel = resource("ipykernel")
	 (resources - [ipykernel]).each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install libexec/"bin/ipython"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 man1.install libexec/"share/man/man1/ipython.1"
	 ipykernel.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 kernel_dir = Dir.mktmpdir
	 system libexec/"bin/ipython", "kernel", "install", "--prefix", kernel_dir
	 (share/"jupyter/kernels/python3").install Dir["#{kernel_dir}/share/jupyter/kernels/python3/*"]
	 inreplace share/"jupyter/kernels/python3/kernel.json", "]", <<~EOS
	 ],
	 "env": {
	 "PYTHONPATH": "#{ENV["PYTHONPATH"]}"
	 }
	 EOS
	 rm_rf etc/"jupyter/kernels/python3"
	 (etc/"jupyter/kernels/python3").install Dir[share/"jupyter/kernels/python3/*"]
