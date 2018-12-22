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
conflicts :
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
