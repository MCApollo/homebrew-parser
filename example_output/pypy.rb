name :
	 Pypy
homepage :
	 https://pypy.org/
url :
	 https://bitbucket.org/pypy/pypy/downloads/pypy2-v6.0.0-src.tar.bz2
description :
	 Highly performant implementation of Python 2 in Python
build_deps :
	 pkg-config
link_deps :
	 :arch
	 gdbm
	 libffi
	 openssl
	 sqlite
optional_deps :
conflicts :
resource :
	 ['bootstrap', 'setuptools', 'pip']
	 ['https://bitbucket.org/pypy/pypy/downloads/pypy2-v6.0.0-osx64.tar.bz2', 'https://files.pythonhosted.org/packages/1a/04/d6f1159feaccdfc508517dba1929eb93a2854de729fa68da9d5c6b48fa00/setuptools-39.2.0.zip', 'https://files.pythonhosted.org/packages/ae/e8/2340d46ecadb1692a1e455f13f75e596d4eab3d11a57446f08259dee8f02/pip-10.0.1.tar.gz']
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = ""
	 ENV["PYPY_USESSION_DIR"] = buildpath
	 resource("bootstrap").stage buildpath/"bootstrap"
	 python = buildpath/"bootstrap/bin/pypy"
	 cd "pypy/goal" do
	 system python, buildpath/"rpython/bin/rpython",
	 "-Ojit", "--shared", "--cc", ENV.cc, "--verbose",
	 "--make-jobs", ENV.make_jobs, "targetpypystandalone.py"
	 end
	 libexec.mkpath
	 cd "pypy/tool/release" do
	 package_args = %w[--archive-name pypy --targetdir .]
	 system python, "package.py", *package_args
	 system "tar", "-C", libexec.to_s, "--strip-components", "1", "-xf", "pypy.tar.bz2"
	 end
	 (libexec/"lib").install libexec/"bin/libpypy-c.dylib"
	 MachO::Tools.change_install_name("#{libexec}/bin/pypy",
	 "@rpath/libpypy-c.dylib",
	 "#{libexec}/lib/libpypy-c.dylib")
	 bin.install_symlink libexec/"bin/pypy"
	 lib.install_symlink libexec/"lib/libpypy-c.dylib"
	 prefix_site_packages.mkpath
	 unless (libexec/"site-packages").symlink?
	 rm_rf libexec/"site-packages/site-packages"
	 mv Dir[libexec/"site-packages/*"], prefix_site_packages
	 rm_rf libexec/"site-packages"
	 end
	 libexec.install_symlink prefix_site_packages
	 scripts_folder.mkpath
	 (distutils+"distutils.cfg").atomic_write <<~EOS
	 [install]
	 install-scripts=#{scripts_folder}
	 EOS
	 %w[setuptools pip].each do |pkg|
	 resource(pkg).stage do
	 system bin/"pypy", "-s", "setup.py", "--no-user-cfg", "install",
	 "--force", "--verbose"
	 end
	 end
	 bin.install_symlink scripts_folder/"easy_install" => "easy_install_pypy"
	 bin.install_symlink scripts_folder/"pip" => "pip_pypy"
	 %w[easy_install_pypy pip_pypy].each { |e| (HOMEBREW_PREFIX/"bin").install_symlink bin/e }
