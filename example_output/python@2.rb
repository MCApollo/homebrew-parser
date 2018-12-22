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
	 end
	 args << "--without-gcc" if ENV.compiler == :clang
	 cflags   = []
	 ldflags  = []
	 cppflags = []
	 if MacOS.sdk_path_if_needed
	 cflags  << "-isysroot #{MacOS.sdk_path}" << "-I#{MacOS.sdk_path}/usr/include"
	 ldflags << "-isysroot #{MacOS.sdk_path}"
	 cflags  << "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
	 end
	 args << "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 inreplace "setup.py" do |s|
	 s.gsub! "do_readline = self.compiler.find_library_file(lib_dirs, 'readline')",
	 "do_readline = '#{Formula["readline"].opt_lib}/libhistory.dylib'"
	 s.gsub! "/usr/local/ssl", Formula["openssl"].opt_prefix
	 end
	 inreplace "setup.py" do |s|
	 s.gsub! "sqlite_setup_debug = False", "sqlite_setup_debug = True"
	 s.gsub! "for d_ in inc_dirs + sqlite_inc_paths:",
	 "for d_ in ['#{Formula["sqlite"].opt_include}']:"
	 s.gsub! 'sqlite_defines.append(("SQLITE_OMIT_LOAD_EXTENSION", "1"))', ""
	 end
	 inreplace "./Lib/ctypes/macholib/dyld.py" do |f|
	 f.gsub! "DEFAULT_LIBRARY_FALLBACK = [", "DEFAULT_LIBRARY_FALLBACK = [ '#{HOMEBREW_PREFIX}/lib',"
	 f.gsub! "DEFAULT_FRAMEWORK_FALLBACK = [", "DEFAULT_FRAMEWORK_FALLBACK = [ '#{HOMEBREW_PREFIX}/Frameworks',"
	 end
	 args << "CFLAGS=#{cflags.join(" ")}" unless cflags.empty?
	 args << "LDFLAGS=#{ldflags.join(" ")}" unless ldflags.empty?
	 args << "CPPFLAGS=#{cppflags.join(" ")}" unless cppflags.empty?
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize do
	 system "make", "install", "PYTHONAPPSDIR=#{prefix}"
	 system "make", "frameworkinstallextras", "PYTHONAPPSDIR=#{pkgshare}"
	 end
	 inreplace lib_cellar/"config/Makefile" do |s|
	 s.change_make_var! "LINKFORSHARED",
	 "-u _PyMac_Error $(PYTHONFRAMEWORKINSTALLDIR)/Versions/$(VERSION)/$(PYTHONFRAMEWORK)"
	 end
	 inreplace [lib_cellar/"_sysconfigdata.py",
	 lib_cellar/"config/Makefile",
	 frameworks/"Python.framework/Versions/Current/lib/pkgconfig/python-2.7.pc"],
	 prefix, opt_prefix
	 (lib/"pkgconfig").install_symlink Dir[frameworks/"Python.framework/Versions/Current/lib/pkgconfig/*"]
	 rm bin/"2to3"
	 site_packages_cellar.rmtree
	 (libexec/"setuptools").install resource("setuptools")
	 (libexec/"pip").install resource("pip")
	 (libexec/"wheel").install resource("wheel")
	 if MacOS.version > :snow_leopard
	 cd "Doc" do
	 system "make", "html"
	 doc.install Dir["build/html/*"]
	 end
	 end
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
	 end
	 include_dirs = [HOMEBREW_PREFIX/"include", Formula["openssl"].opt_include,
	 Formula["sqlite"].opt_include]
	 library_dirs = [HOMEBREW_PREFIX/"lib", Formula["openssl"].opt_lib,
	 Formula["sqlite"].opt_lib]
	 cfg = lib_cellar/"distutils/distutils.cfg"
	 cfg.atomic_write <<~EOS
	 [install]
	 prefix=#{HOMEBREW_PREFIX}
	 [build_ext]
	 include_dirs=#{include_dirs.join ":"}
	 library_dirs=#{library_dirs.join ":"}
	 EOS
