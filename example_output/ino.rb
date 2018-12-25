name :
	 Ino
homepage :
	 http://inotool.org
url :
	 https://files.pythonhosted.org/packages/source/i/ino/ino-0.3.6.tar.gz
description :
	 Command-line toolkit for working with Arduino hardware
build_deps :
link_deps :
	 picocom
	 python@2
optional_deps :
conflicts :
resource :
	 ['argparse', 'ordereddict', 'configobj', 'pyserial', 'six', 'markupsafe', 'jinja2']
	 ['https://files.pythonhosted.org/packages/source/a/argparse/argparse-1.2.1.tar.gz', 'https://files.pythonhosted.org/packages/source/o/ordereddict/ordereddict-1.1.tar.gz', 'https://files.pythonhosted.org/packages/source/c/configobj/configobj-5.0.5.tar.gz', 'https://files.pythonhosted.org/packages/source/p/pyserial/pyserial-2.7.tar.gz', 'https://files.pythonhosted.org/packages/source/s/six/six-1.7.2.tar.gz', 'https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-0.23.tar.gz', 'https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-2.7.3.tar.gz']
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = lib+"python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", prefix+"lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
	 end
	 system "python", "setup.py", "install", "--prefix=#{prefix}"
	 rm Dir["#{lib}/python2.7/site-packages/*.pth"]
	 bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
