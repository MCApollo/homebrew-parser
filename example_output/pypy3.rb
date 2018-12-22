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
conflicts :
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
