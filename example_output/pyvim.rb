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
optional_deps :
conflicts :
resource :
	 ['docopt', 'prompt_toolkit', 'pyflakes', 'Pygments', 'six', 'wcwidth']
	 ['https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz', 'https://files.pythonhosted.org/packages/3e/36/d24222c4a44cb7b8d902db407e1918d8553c765b1384d78c7ea7a85b144c/prompt_toolkit-2.0.3.tar.gz', 'https://files.pythonhosted.org/packages/92/9e/386c0d9deef14996eb90d9deebbcb9d3ceb70296840b09615cb61b2ae231/pyflakes-2.0.0.tar.gz', 'https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz']
patches :
EOF_patch :
install :
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec)
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
