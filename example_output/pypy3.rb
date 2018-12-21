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
