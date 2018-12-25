name :
	 Bup
homepage :
	 https://github.com/bup/bup
url :
	 https://github.com/bup/bup/archive/0.29.2.tar.gz
description :
	 Backup tool
build_deps :
	 pandoc
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['backports_abc', 'certifi', 'singledispatch', 'six', 'tornado']
	 ['https://files.pythonhosted.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8/backports_abc-0.5.tar.gz', 'https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716/certifi-2018.10.15.tar.gz', 'https://files.pythonhosted.org/packages/d9/e9/513ad8dc17210db12cb14f2d4d190d618fb87dd38814203ea71c87ba5b68/singledispatch-3.4.0.3.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/e6/78/6e7b5af12c12bdf38ca9bfe863fcaf53dc10430a312d0324e76c1e5ca426/tornado-5.1.1.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 system "make", "AC_CPP_PROG=xcrun cpp"
	 system "make", "install", "DESTDIR=#{prefix}", "PREFIX="
	 mv bin/"bup", libexec/"bup.py"
	 (bin/"bup").write_env_script libexec/"bup.py", :PYTHONPATH => ENV["PYTHONPATH"]
