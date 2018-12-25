name :
	 SubversionAT18
homepage :
	 https://subversion.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=subversion/subversion-1.8.19.tar.bz2
description :
	 Version control system
build_deps :
	 pkg-config
	 scons
link_deps :
	 apr
	 apr-util
	 openssl
	 sqlite
	 swig
optional_deps :
	 :java
	 python@2
conflicts :
resource :
	 ['serf']
	 ['https://www.apache.org/dyn/closer.cgi?path=serf/serf-1.3.9.tar.bz2']
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index 445251b..6ff4332 100755
	 --- a/configure
	 +++ b/configure
	 @@ -25366,6 +25366,8 @@ fi
	 SWIG_CPPFLAGS="$CPPFLAGS"
	 SWIG_CPPFLAGS=`echo "$SWIG_CPPFLAGS" | $SED -e 's/-no-cpp-precomp //'`
	 +  SWIG_CPPFLAGS=`echo "$SWIG_CPPFLAGS" | $SED -e 's/-F\/[^ ]* //'`
	 +  SWIG_CPPFLAGS=`echo "$SWIG_CPPFLAGS" | $SED -e 's/-isystem\/[^ ]* //'`
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
	 inreplace "Makefile.in",
	 "@APXS@ -i -S LIBEXECDIR=\"$(APACHE_LIBEXECDIR)\"",
	 "@APXS@ -i -S LIBEXECDIR=\"#{libexec.to_s.sub("@", "\\@")}\""
	 serf_prefix = libexec/"serf"
	 resource("serf").stage do
	 inreplace "SConstruct", "unique=1", "unique=0"
	 args = %W[PREFIX=#{serf_prefix} GSSAPI=/usr CC=#{ENV.cc}
	 CFLAGS=#{ENV.cflags} LINKFLAGS=#{ENV.ldflags}
	 OPENSSL=#{Formula["openssl"].opt_prefix}]
	 if MacOS.version >= :sierra || !MacOS::CLT.installed?
	 args << "APR=#{Formula["apr"].opt_prefix}"
	 args << "APU=#{Formula["apr-util"].opt_prefix}"
	 end
	 scons(*args)
	 scons "install"
	 end
	 if build.include? "unicode-path"
	 raise <<~EOS
	 The --unicode-path patch is not supported on Subversion 1.8.
	 Upgrading from a 1.7 version built with this patch is not supported.
	 You should stay on 1.7, install 1.7 from homebrew-versions, or
	 brew rm subversion && brew install subversion
	 to build a new version of 1.8 without this patch.
	 EOS
	 end
	 ENV.deparallelize if build.with? "java"
	 args = ["--disable-debug",
	 "--prefix=#{prefix}",
	 "--with-zlib=/usr",
	 "--with-sqlite=#{Formula["sqlite"].opt_prefix}",
	 "--with-serf=#{serf_prefix}",
	 "--disable-mod-activation",
	 "--disable-nls",
	 "--without-apache-libexecdir",
	 "--without-berkeley-db"]
	 args << "--enable-javahl" << "--without-jikes" if build.with? "java"
	 if MacOS::CLT.installed? && MacOS.version < :sierra
	 args << "--with-apr=/usr"
	 args << "--with-apr-util=/usr"
	 else
	 args << "--with-apr=#{Formula["apr"].opt_prefix}"
	 args << "--with-apr-util=#{Formula["apr-util"].opt_prefix}"
	 args << "--with-apxs=no"
	 end
	 if build.with? "ruby"
	 args << "--with-ruby-sitedir=#{lib}/ruby"
	 args << "RUBY=/usr/bin/ruby"
	 end
	 ENV["ac_cv_python_compile"] = ENV.cc
	 inreplace "Makefile.in",
	 "toolsdir = @bindir@/svn-tools",
	 "toolsdir = @libexecdir@/svn-tools"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 bash_completion.install "tools/client-side/bash_completion" => "subversion"
	 system "make", "tools"
	 system "make", "install-tools"
	 if build.with? "python@2"
	 system "make", "swig-py"
	 system "make", "install-swig-py"
	 (lib/"python2.7/site-packages").install_symlink Dir["#{lib}/svn-python/*"]
	 end
	 if build.with? "perl"
	 ENV.deparallelize
	 perl_core = Pathname.new(`perl -MConfig -e 'print $Config{archlib}'`)+"CORE"
	 unless perl_core.exist?
	 onoe "perl CORE directory does not exist in '#{perl_core}'"
	 end
	 inreplace "Makefile" do |s|
	 s.change_make_var! "SWIG_PL_INCLUDES",
	 "$(SWIG_INCLUDES) -arch #{MacOS.preferred_arch} -g -pipe -fno-common -DPERL_DARWIN -fno-strict-aliasing -I/usr/local/include -I#{perl_core}"
	 end
	 system "make", "swig-pl"
	 system "make", "install-swig-pl", "DESTDIR=#{prefix}"
	 lib.install Dir["#{prefix}/#{lib}/*"]
	 end
	 if build.with? "java"
	 system "make", "javahl"
	 system "make", "install-javahl"
	 end
	 if build.with? "ruby"
	 system "make", "swig-rb", "EXTRA_SWIG_LDFLAGS=-L/usr/lib"
	 system "make", "install-swig-rb"
	 end
	 end
	 def caveats
	 s = <<~EOS
	 svntools have been installed to:
	 #{opt_libexec}
	 EOS
	 if build.with? "perl"
	 s += "\n"
	 s += <<~EOS
	 The perl bindings are located in various subdirectories of:
	 #{prefix}/Library/Perl
	 EOS
	 end
	 if build.with? "ruby"
	 s += "\n"
	 s += <<~EOS
	 You may need to add the Ruby bindings to your RUBYLIB from:
	 #{HOMEBREW_PREFIX}/lib/ruby
	 EOS
	 end
	 if build.with? "java"
	 s += "\n"
	 s += <<~EOS
	 You may need to link the Java bindings into the Java Extensions folder:
	 sudo mkdir -p /Library/Java/Extensions
	 sudo ln -s #{HOMEBREW_PREFIX}/lib/libsvnjavahl-1.dylib /Library/Java/Extensions/libsvnjavahl-1.dylib
	 EOS
	 end
	 s
