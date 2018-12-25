name :
	 Headphones
homepage :
	 https://github.com/rembo10/headphones
url :
	 https://github.com/rembo10/headphones/archive/v0.5.19.tar.gz
description :
	 Automatic music downloader for SABnzbd
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['Markdown', 'Cheetah']
	 ['https://files.pythonhosted.org/packages/b3/73/fc5c850f44af5889192dff783b7b0d8f3fe8d30b65c8e3f78f8f0265fecf/Markdown-2.6.11.tar.gz', 'https://files.pythonhosted.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz']
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 ENV["CHEETAH_INSTALL_WITHOUT_SETUPTOOLS"] = "1"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec)
	 end
	 end
	 (bin/"headphones").write(startup_script)
