name :
	 Findutils
homepage :
	 https://www.gnu.org/software/findutils/
url :
	 https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz
description :
	 Collection of GNU find, xargs, and locate
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["gl_cv_func_getcwd_abort_bug"] = "no" if MacOS.version == :el_capitan
	 args = %W[
	 --prefix=#{prefix}
	 --localstatedir=#{var}/locate
	 --disable-dependency-tracking
	 --disable-debug
	 ]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 updatedb = (build.with?("default-names") ? "updatedb" : "gupdatedb")
	 (libexec/"bin").install bin/updatedb
	 (bin/updatedb).write <<~EOS
	 #!/bin/sh
	 export LC_ALL='C'
	 exec "#{libexec}/bin/#{updatedb}" "$@"
	 EOS
	 if build.without? "default-names"
	 [[prefix, bin], [share, man/"*"]].each do |base, path|
	 Dir[path/"g*"].each do |p|
	 f = Pathname.new(p)
	 gnupath = "gnu" + f.relative_path_from(base).dirname
	 (libexec/gnupath).install_symlink f => f.basename.sub(/^g/, "")
	 end
	 end
	 (var/"locate").mkpath
