name :
	 Pypy3
homepage :
	 https://pypy.org/
url :
	 https://bitbucket.org/pypy/pypy/downloads/pypy3-v6.0.0-src.tar.bz2
description :
	 Implementation of Python 3 in Python
build_deps :
	 pkg-config
	 pypy
link_deps :
	 :arch
	 gdbm
	 libffi
	 openssl
	 sqlite
	 xz
optional_deps :
conflicts :
resource :
	 ['pyparsing', 'six', 'packaging', 'appdirs', 'setuptools', 'pip']
	 ['https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/77/32/439f47be99809c12ef2da8b60a2c47987786d2c6c9205549dd6ef95df8bd/packaging-17.1.tar.gz', 'https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz', 'https://files.pythonhosted.org/packages/72/c2/c09362ab29338413ab687b47dab03bab4a792e2bbb727a1eb5e0a88e3b86/setuptools-39.0.1.zip', 'https://files.pythonhosted.org/packages/ae/e8/2340d46ecadb1692a1e455f13f75e596d4eab3d11a57446f08259dee8f02/pip-10.0.1.tar.gz']
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra && MacOS::Xcode.installed? && MacOS::Xcode.version >= "9.0"
	 ENV.delete("SDKROOT")
	 end
	 inreplace "pypy/tool/build_cffi_imports.py" do |s|
	 s.gsub! "http://", "https://"
	 s.gsub! "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.6.2.tar.gz",
	 "https://mirrorservice.org/pub/OpenBSD/LibreSSL/libressl-2.6.2.tar.gz"
	 s.gsub! "https://tukaani.org/xz/xz-5.2.3.tar.gz",
	 "https://netix.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz"
	 s.gsub! "os.path.join(tempfile.gettempdir(), 'pypy-archives')",
	 "os.path.join('#{buildpath}', 'pypy-archives')"
	 end
	 ENV["PYTHONPATH"] = ""
	 ENV["PYPY_USESSION_DIR"] = buildpath
	 python = Formula["pypy"].opt_bin/"pypy"
	 cd "pypy/goal" do
	 system python, buildpath/"rpython/bin/rpython",
	 "-Ojit", "--shared", "--cc", ENV.cc, "--verbose",
	 "--make-jobs", ENV.make_jobs, "targetpypystandalone.py"
	 end
	 libexec.mkpath
	 cd "pypy/tool/release" do
	 system python, "package.py", "--archive-name", "pypy3", "--targetdir", "."
	 system "tar", "-C", libexec.to_s, "--strip-components", "1", "-xf", "pypy3.tar.bz2"
	 end
	 (libexec/"lib").install libexec/"bin/libpypy3-c.dylib" => "libpypy3-c.dylib"
	 MachO::Tools.change_install_name("#{libexec}/bin/pypy3",
	 "@rpath/libpypy3-c.dylib",
	 "#{libexec}/lib/libpypy3-c.dylib")
	 MachO::Tools.change_dylib_id("#{libexec}/lib/libpypy3-c.dylib",
	 "#{opt_libexec}/lib/libpypy3-c.dylib")
	 (libexec/"lib-python").install "lib-python/3"
	 libexec.install %w[include lib_pypy]
	 bin.install_symlink libexec/"bin/pypy3"
	 bin.install_symlink libexec/"bin/pypy" => "pypy3.5"
	 lib.install_symlink libexec/"lib/libpypy3-c.dylib"
	 %w[_sqlite3 _curses syslog gdbm _tkinter].each do |module_name|
	 quiet_system bin/"pypy3", "-c", "import #{module_name}"
	 end
	 prefix_site_packages.mkpath
	 libexec.install_symlink prefix_site_packages
	 scripts_folder.mkpath
	 (distutils+"distutils.cfg").atomic_write <<~EOS
	 [install]
	 install-scripts=#{scripts_folder}
	 EOS
	 %w[appdirs pyparsing six packaging setuptools pip].each do |pkg|
	 resource(pkg).stage do
	 system bin/"pypy3", "-s", "setup.py", "install", "--force", "--verbose"
	 end
	 end
	 bin.install_symlink scripts_folder/"easy_install" => "easy_install_pypy3"
	 bin.install_symlink scripts_folder/"pip" => "pip_pypy3"
	 %w[easy_install_pypy3 pip_pypy3].each { |e| (HOMEBREW_PREFIX/"bin").install_symlink bin/e }
