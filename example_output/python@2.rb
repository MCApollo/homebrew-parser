name :
	 PythonAT2
homepage :
	 https://www.python.org/
url :
	 https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tar.xz
description :
	 Interpreted, interactive, object-oriented programming language
build_deps :
	 pkg-config
link_deps :
	 sphinx-doc
	 gdbm
	 openssl
	 readline
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 ENV["PYTHONHOME"] = nil
	 ENV["PYTHONPATH"] = nil
	 args = %W[
	 --prefix=#{prefix}
	 --enable-ipv6
	 --datarootdir=#{share}
	 --datadir=#{share}
	 --enable-framework=#{frameworks}
	 --without-ensurepip
	 ]
	 if DevelopmentTools.clang_build_version >= 802 &&
	 DevelopmentTools.clang_build_version < 902
	 args << "--without-computed-gotos"
	 rm_f %W[
	 #{HOMEBREW_PREFIX}/bin/easy_install
	 #{HOMEBREW_PREFIX}/bin/pip
	 #{HOMEBREW_PREFIX}/bin/wheel
	 ]
	 site_packages.mkpath
	 site_packages_cellar.unlink if site_packages_cellar.exist?
	 site_packages_cellar.parent.install_symlink site_packages
	 rm_rf Dir["#{site_packages}/sitecustomize.py[co]"]
	 (site_packages/"sitecustomize.py").atomic_write(sitecustomize)
	 rm_rf Dir["#{site_packages}/setuptools*"]
	 rm_rf Dir["#{site_packages}/distribute*"]
	 rm_rf Dir["#{site_packages}/pip[-_.][0-9]*", "#{site_packages}/pip"]
	 setup_args = ["-s", "setup.py", "--no-user-cfg", "install", "--force",
	 "--verbose",
	 "--single-version-externally-managed",
	 "--record=installed.txt",
	 "--install-scripts=#{bin}",
	 "--install-lib=#{site_packages}"]
	 (libexec/"setuptools").cd { system "#{bin}/python", *setup_args }
	 (libexec/"pip").cd { system "#{bin}/python", *setup_args }
	 (libexec/"wheel").cd { system "#{bin}/python", *setup_args }
	 %w[pip pip2 pip2.7 easy_install easy_install-2.7 wheel].each do |e|
	 (HOMEBREW_PREFIX/"bin").install_symlink bin/e
