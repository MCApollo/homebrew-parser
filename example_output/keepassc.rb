name :
	 Keepassc
homepage :
	 https://raymontag.github.com/keepassc/
url :
	 https://files.pythonhosted.org/packages/c8/87/a7d40d4a884039e9c967fb2289aa2aefe7165110a425c4fb74ea758e9074/keepassc-1.8.2.tar.gz
description :
	 Curses-based password manager for KeePass v.1.x and KeePassX
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 pyver = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python#{pyver}/site-packages"
	 install_args = %W[setup.py install --prefix=#{libexec}]
	 resource("pycryptodomex").stage { system "python3", *install_args }
	 resource("kppy").stage { system "python3", *install_args }
	 system "python3", *install_args
	 man1.install Dir["*.1"]
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
