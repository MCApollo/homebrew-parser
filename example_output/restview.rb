name :
	 Restview
homepage :
	 https://mg.pov.lt/restview/
url :
	 https://github.com/mgedmin/restview/archive/2.9.1.tar.gz
description :
	 Viewer for ReStructuredText documents that renders them on the fly
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['bleach', 'cffi', 'cmarkgfm', 'docutils', 'future', 'html5lib', 'pycparser', 'Pygments', 'readme_renderer', 'six', 'webencodings', 'sample']
	 ['https://files.pythonhosted.org/packages/eb/ea/58428609442130dc31d3a59010bf6cbd263a16c589d01d23b7c1e6997e3b/bleach-2.1.3.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/e2/a3/4021fbc17c5afe7f307d14eba0d6899a8e66b351ab65649b1c89c50a836d/cmarkgfm-0.4.2.tar.gz', 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/85/3e/cf449cf1b5004e87510b9368e7a5f1acd8831c2d6691edd3c62a0823f98f/html5lib-1.0.1.tar.gz', 'https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz', 'https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/c8/aa/4b98370d8a5af38d2f9b75660e1240fa6f686fac4daae22a4172467d5574/readme_renderer-20.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz', 'https://raw.githubusercontent.com/mgedmin/restview/140e23ad6604d52604bc11978fd13d3199150862/sample.rst']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 res = resources.reject { |r| r.name == "sample" }
	 res.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
