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
	 end
	 args << "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 inreplace "setup.py",
	 "do_readline = self.compiler.find_library_file(lib_dirs, 'readline')",
	 "do_readline = '#{Formula["readline"].opt_lib}/libhistory.dylib'"
	 inreplace "setup.py" do |s|
	 s.gsub! "sqlite_setup_debug = False", "sqlite_setup_debug = True"
	 s.gsub! "for d_ in inc_dirs + sqlite_inc_paths:",
	 "for d_ in ['#{Formula["sqlite"].opt_include}']:"
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
	 Dir.glob("#{prefix}/*.app") { |app| mv app, app.sub(/\.app$/, " 3.app") }
	 inreplace Dir[lib_cellar/"**/_sysconfigdata_m_darwin_darwin.py",
	 lib_cellar/"config*/Makefile",
	 frameworks/"Python.framework/Versions/3*/lib/pkgconfig/python-3.?.pc"],
	 prefix, opt_prefix
	 inreplace Dir[lib_cellar/"config*/Makefile"],
	 /^LINKFORSHARED=(.*)PYTHONFRAMEWORKDIR(.*)/,
	 "LINKFORSHARED=\\1PYTHONFRAMEWORKINSTALLDIR\\2"
	 inreplace Dir[lib_cellar/"**/_sysconfigdata_m_darwin_darwin.py"],
	 %r{('LINKFORSHARED': .*?)'(Python.framework/Versions/3.\d+/Python)'}m,
	 "\\1'#{opt_prefix}/Frameworks/\\2'"
	 ["Headers", "Python", "Resources"].each { |f| rm(prefix/"Frameworks/Python.framework/#{f}") }
	 rm prefix/"Frameworks/Python.framework/Versions/Current"
	 (lib/"pkgconfig").install_symlink Dir["#{frameworks}/Python.framework/Versions/#{xy}/lib/pkgconfig/*"]
	 (prefix/"Frameworks/Python.framework/Versions/#{xy}/lib/python#{xy}/site-packages").rmtree
	 %w[setuptools pip wheel].each do |r|
	 (libexec/r).install resource(r)
	 end
	 {
	 "idle"          => "idle3",
	 "pydoc"         => "pydoc3",
	 "python"        => "python3",
	 "python-config" => "python3-config",
	 }.each do |unversioned_name, versioned_name|
	 (libexec/"bin").install_symlink (bin/versioned_name).realpath => unversioned_name
	 end
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
	 end
	 end
	 rm_rf [bin/"pip", bin/"easy_install"]
	 mv bin/"wheel", bin/"wheel3"
	 {
	 "easy_install" => "easy_install-#{xy}",
	 "pip"          => "pip3",
	 "wheel"        => "wheel3",
	 }.each do |unversioned_name, versioned_name|
	 (libexec/"bin").install_symlink (bin/versioned_name).realpath => unversioned_name
	 end
	 %W[pip3 pip#{xy} easy_install-#{xy} wheel3].each do |e|
	 (HOMEBREW_PREFIX/"bin").install_symlink bin/e
	 end
	 include_dirs = [HOMEBREW_PREFIX/"include", Formula["openssl"].opt_include,
	 Formula["sqlite"].opt_include]
	 library_dirs = [HOMEBREW_PREFIX/"lib", Formula["openssl"].opt_lib,
	 Formula["sqlite"].opt_lib]
	 cfg = prefix/"Frameworks/Python.framework/Versions/#{xy}/lib/python#{xy}/distutils/distutils.cfg"
	 cfg.atomic_write <<~EOS
	 [install]
	 prefix=#{HOMEBREW_PREFIX}
	 [build_ext]
	 include_dirs=#{include_dirs.join ":"}
	 library_dirs=#{library_dirs.join ":"}
	 EOS
