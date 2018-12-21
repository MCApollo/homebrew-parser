name :
	 Python
homepage :
	 https://www.python.org/
url :
	 https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tar.xz
description :
	 Interpreted, interactive, object-oriented programming language
build_deps :
	 pkg-config
link_deps :
	 gdbm
	 openssl
	 readline
	 sqlite
	 xz
conflicts :
patches :
EOF_patch :
install :
	 ENV["PYTHONHOME"] = nil
	 ENV["PYTHONPATH"] = nil
	 xy = (buildpath/"configure.ac").read.slice(/PYTHON_VERSION, (3\.\d)/, 1)
	 lib_cellar = prefix/"Frameworks/Python.framework/Versions/#{xy}/lib/python#{xy}"
	 args = %W[
	 --prefix=#{prefix}
	 --enable-ipv6
	 --datarootdir=#{share}
	 --datadir=#{share}
	 --enable-framework=#{frameworks}
	 --enable-loadable-sqlite-extensions
	 --without-ensurepip
	 --with-dtrace
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 ]
	 args << "--without-gcc" if ENV.compiler == :clang
	 cflags   = []
	 ldflags  = []
	 cppflags = []
	 if MacOS.sdk_path_if_needed
	 cflags  << "-isysroot #{MacOS.sdk_path}" << "-I#{MacOS.sdk_path}/usr/include"
	 ldflags << "-isysroot #{MacOS.sdk_path}"
	 cflags << "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
	 ENV.delete "PYTHONPATH"
	 xy = (prefix/"Frameworks/Python.framework/Versions").children.min.basename.to_s
	 site_packages = HOMEBREW_PREFIX/"lib/python#{xy}/site-packages"
	 site_packages_cellar = prefix/"Frameworks/Python.framework/Versions/#{xy}/lib/python#{xy}/site-packages"
	 site_packages.mkpath
	 site_packages_cellar.unlink if site_packages_cellar.exist?
	 site_packages_cellar.parent.install_symlink site_packages
	 rm_rf Dir["#{site_packages}/sitecustomize.py[co]"]
	 (site_packages/"sitecustomize.py").atomic_write(sitecustomize)
	 rm_rf Dir["#{site_packages}/setuptools*"]
	 rm_rf Dir["#{site_packages}/distribute*"]
	 rm_rf Dir["#{site_packages}/pip[-_.][0-9]*", "#{site_packages}/pip"]
	 %w[setuptools pip wheel].each do |pkg|
	 (libexec/pkg).cd do
	 system bin/"python3", "-s", "setup.py", "--no-user-cfg", "install",
	 "--force", "--verbose", "--install-scripts=#{bin}",
	 "--install-lib=#{site_packages}",
	 "--single-version-externally-managed",
	 "--record=installed.txt"
