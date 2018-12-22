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
