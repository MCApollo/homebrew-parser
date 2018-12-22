name :
	 Sbcl
homepage :
	 http://www.sbcl.org/
url :
	 https://downloads.sourceforge.net/project/sbcl/sbcl/1.4.13/sbcl-1.4.13-source.tar.bz2
description :
	 Steel Bank Common Lisp system
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c5ffdb11/sbcl/patch-make-doc.diff
EOF_patch :
install :
	 ENV.delete_if do |_, value|
	 ascii_val = value.dup
	 ascii_val.force_encoding("ASCII-8BIT") if ascii_val.respond_to? :force_encoding
	 ascii_val =~ /[\x80-\xff]/n
	 end
	 tmpdir = Pathname.new(Dir.mktmpdir)
	 tmpdir.install resource("bootstrap64")
	 command = "#{tmpdir}/src/runtime/sbcl"
	 core = "#{tmpdir}/output/sbcl.core"
	 xc_cmdline = "#{command} --core #{core} --disable-debugger --no-userinit --no-sysinit"
	 args = [
	 "--prefix=#{prefix}",
	 "--xc-host=#{xc_cmdline}",
	 "--with-sb-core-compression",
	 "--with-sb-ldb",
	 "--with-sb-thread",
	 ]
	 ENV["SBCL_MACOSX_VERSION_MIN"] = MacOS.version
	 system "./make.sh", *args
	 ENV["INSTALL_ROOT"] = prefix
	 system "sh", "install.sh"
	 bin.env_script_all_files(libexec/"bin", :SBCL_SOURCE_ROOT => pkgshare/"src")
	 pkgshare.install %w[contrib src]
	 (lib/"sbcl/sbclrc").write <<~EOS
	 (setf (logical-pathname-translations "SYS")
	 '(("SYS:SRC;**;*.*.*" #p"#{pkgshare}/src/**/*.*")
	 ("SYS:CONTRIB;**;*.*.*" #p"#{pkgshare}/contrib/**/*.*")))
	 EOS
