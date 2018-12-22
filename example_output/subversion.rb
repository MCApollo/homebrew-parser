name :
	 Subversion
homepage :
	 https://subversion.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=subversion/subversion-1.10.2.tar.bz2
description :
	 Version control system designed to be a better CVS
build_deps :
	 pkg-config
	 scons
	 swig
link_deps :
	 apr
	 apr-util
	 lz4
	 openssl
	 perl
	 sqlite
	 utf8proc
	 :java
conflicts :
patches :
EOF_patch :
	 diff --git a/subversion/bindings/swig/perl/native/Makefile.PL.in b/subversion/bindings/swig/perl/native/Makefile.PL.in
	 index a60430b..bd9b017 100644
	 --- a/subversion/bindings/swig/perl/native/Makefile.PL.in
	 +++ b/subversion/bindings/swig/perl/native/Makefile.PL.in
	 @@ -76,10 +76,13 @@ my $apr_ldflags = '@SVN_APR_LIBS@'
	 chomp $apr_shlib_path_var;
	 +my $config_ccflags = $Config{ccflags};
	 +$config_ccflags =~ s/-arch\s+\S+//g;
	 +
	 my %config = (
	 ABSTRACT => 'Perl bindings for Subversion',
	 DEFINE => $cppflags,
	 -    CCFLAGS => join(' ', $cflags, $Config{ccflags}),
	 +    CCFLAGS => join(' ', $cflags, $config_ccflags),
	 INC  => join(' ', $includes, $cppflags,
	 " -I$swig_srcdir/perl/libsvn_swig_perl",
	 " -I$svnlib_srcdir/include",
	 diff --git a/build/get-py-info.py b/build/get-py-info.py
	 index 29a6c0a..dd1a5a8 100644
	 --- a/build/get-py-info.py
	 +++ b/build/get-py-info.py
	 @@ -83,7 +83,7 @@ def link_options():
	 options = sysconfig.get_config_var('LDSHARED').split()
	 fwdir = sysconfig.get_config_var('PYTHONFRAMEWORKDIR')
	 -  if fwdir and fwdir != "no-framework":
	 +  if fwdir and fwdir != "no-framework" and sys.platform != 'darwin':
	 fwprefix = sysconfig.get_config_var('PYTHONFRAMEWORKPREFIX')
install :
	 ENV.prepend_path "PATH", "/System/Library/Frameworks/Python.framework/Versions/2.7/bin"
	 serf_prefix = libexec/"serf"
	 resource("serf").stage do
	 args = %W[
	 PREFIX=#{serf_prefix} GSSAPI=/usr CC=#{ENV.cc}
	 CFLAGS=#{ENV.cflags} LINKFLAGS=#{ENV.ldflags}
	 OPENSSL=#{Formula["openssl"].opt_prefix}
	 APR=#{Formula["apr"].opt_prefix}
	 APU=#{Formula["apr-util"].opt_prefix}
	 ]
	 scons(*args)
	 scons "install"
	 end
	 if build.with? "java"
	 ENV.deparallelize
	 end
	 args = %W[
	 --prefix=#{prefix}
	 --disable-debug
	 --enable-optimize
	 --disable-mod-activation
	 --disable-nls
	 --with-apr-util=#{Formula["apr-util"].opt_prefix}
	 --with-apr=#{Formula["apr"].opt_prefix}
	 --with-apxs=no
	 --with-ruby-sitedir=#{lib}/ruby
	 --with-serf=#{serf_prefix}
	 --with-sqlite=#{Formula["sqlite"].opt_prefix}
	 --with-zlib=/usr
	 --without-apache-libexecdir
	 --without-berkeley-db
	 --without-gpg-agent
	 RUBY=/usr/bin/ruby
	 ]
	 args << "--enable-javahl" << "--without-jikes" if build.with? "java"
	 ENV["ac_cv_python_compile"] = ENV.cc
	 inreplace "Makefile.in",
	 "toolsdir = @bindir@/svn-tools",
	 "toolsdir = @libexecdir@/svn-tools"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 bash_completion.install "tools/client-side/bash_completion" => "subversion"
	 system "make", "tools"
	 system "make", "install-tools"
	 system "make", "swig-py"
	 system "make", "install-swig-py"
	 (lib/"python2.7/site-packages").install_symlink Dir["#{lib}/svn-python/*"]
	 ENV.deparallelize
	 archlib = Utils.popen_read("perl -MConfig -e 'print $Config{archlib}'")
	 perl_core = Pathname.new(archlib)/"CORE"
	 onoe "'#{perl_core}' does not exist" unless perl_core.exist?
	 inreplace "Makefile" do |s|
	 s.change_make_var! "SWIG_PL_INCLUDES",
	 "$(SWIG_INCLUDES) -arch #{MacOS.preferred_arch} -g -pipe -fno-common -DPERL_DARWIN -fno-strict-aliasing -I#{HOMEBREW_PREFIX}/include -I#{perl_core}"
	 end
	 system "make", "swig-pl"
	 system "make", "install-swig-pl"
	 rm_rf prefix/"Library/Perl"
	 if build.with? "java"
	 system "make", "javahl"
	 system "make", "install-javahl"
	 end
	 system "make", "swig-rb", "EXTRA_SWIG_LDFLAGS=-L/usr/lib"
	 system "make", "install-swig-rb"
	 end
	 def caveats
	 s = <<~EOS
	 svntools have been installed to:
	 #{opt_libexec}
	 The perl bindings are located in various subdirectories of:
	 #{opt_lib}/perl5
	 If you wish to use the Ruby bindings you may need to add:
	 #{HOMEBREW_PREFIX}/lib/ruby
	 to your RUBYLIB.
	 EOS
	 if build.with? "java"
	 s += "\n"
	 s += <<~EOS
	 You may need to link the Java bindings into the Java Extensions folder:
	 sudo mkdir -p /Library/Java/Extensions
	 sudo ln -s #{HOMEBREW_PREFIX}/lib/libsvnjavahl-1.dylib /Library/Java/Extensions/libsvnjavahl-1.dylib
	 EOS
	 end
	 s
