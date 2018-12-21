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
	 :java
	 python@2
	 swig
conflicts :
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
