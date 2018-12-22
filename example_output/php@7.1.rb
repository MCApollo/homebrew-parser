name :
	 PhpAT71
homepage :
	 https://secure.php.net/
url :
	 https://php.net/get/php-7.1.25.tar.xz/from/this/mirror
description :
	 General-purpose scripting language
build_deps :
	 pkg-config
link_deps :
	 httpd
	 apr
	 apr-util
	 aspell
	 autoconf
	 curl-openssl
	 freetds
	 freetype
	 gettext
	 glib
	 gmp
	 icu4c
	 jpeg
	 libpng
	 libpq
	 libtool
	 libzip
	 mcrypt
	 openldap
	 openssl
	 pcre
	 sqlite
	 tidy-html5
	 unixodbc
	 webp
conflicts :
patches :
EOF_patch :
	 diff --git a/acinclude.m4 b/acinclude.m4
	 index 168c465f8d..6c087d152f 100644
	 --- a/acinclude.m4
	 +++ b/acinclude.m4
	 @@ -441,7 +441,11 @@ dnl
	 dnl Adds a path to linkpath/runpath (LDFLAGS)
	 dnl
	 AC_DEFUN([PHP_ADD_LIBPATH],[
	 -  if test "$1" != "/usr/$PHP_LIBDIR" && test "$1" != "/usr/lib"; then
	 +  case "$1" in
	 +  "/usr/$PHP_LIBDIR"|"/usr/lib"[)] ;;
	 +  /Library/Developer/CommandLineTools/SDKs/*/usr/lib[)] ;;
	 +  /Applications/Xcode*.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/*/usr/lib[)] ;;
	 +  *[)]
	 PHP_EXPAND_PATH($1, ai_p)
	 ifelse([$2],,[
	 _PHP_ADD_LIBPATH_GLOBAL([$ai_p])
	 @@ -452,8 +456,8 @@ AC_DEFUN([PHP_ADD_LIBPATH],[
	 else
	 _PHP_ADD_LIBPATH_GLOBAL([$ai_p])
	 fi
	 -    ])
	 -  fi
	 +    ]) ;;
	 +  esac
	 ])
	 dnl
	 @@ -487,7 +491,11 @@ dnl add an include path.
	 dnl if before is 1, add in the beginning of INCLUDES.
	 dnl
	 AC_DEFUN([PHP_ADD_INCLUDE],[
	 -  if test "$1" != "/usr/include"; then
	 +  case "$1" in
	 +  "/usr/include"[)] ;;
	 +  /Library/Developer/CommandLineTools/SDKs/*/usr/include[)] ;;
	 +  /Applications/Xcode*.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/*/usr/include[)] ;;
	 +  *[)]
	 PHP_EXPAND_PATH($1, ai_p)
	 PHP_RUN_ONCE(INCLUDEPATH, $ai_p, [
	 if test "$2"; then
	 @@ -495,8 +503,8 @@ AC_DEFUN([PHP_ADD_INCLUDE],[
	 else
	 INCLUDES="$INCLUDES -I$ai_p"
	 fi
	 -    ])
	 -  fi
	 +    ]) ;;
	 +  esac
	 ])
	 dnl internal, don't use
	 @@ -2411,7 +2419,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
	 fi
	 if test -f $ICONV_DIR/$PHP_LIBDIR/lib$iconv_lib_name.a ||
	 -       test -f $ICONV_DIR/$PHP_LIBDIR/lib$iconv_lib_name.$SHLIB_SUFFIX_NAME
	 +       test -f $ICONV_DIR/$PHP_LIBDIR/lib$iconv_lib_name.$SHLIB_SUFFIX_NAME ||
	 +       test -f $ICONV_DIR/$PHP_LIBDIR/lib$iconv_lib_name.tbd
	 then
	 PHP_CHECK_LIBRARY($iconv_lib_name, libiconv, [
	 found_iconv=yes
install :
	 if MacOS.version == :el_capitan || MacOS.version == :sierra
	 ENV["SDKROOT"] = MacOS.sdk_path
	 pear_prefix = pkgshare/"pear"
	 pear_files = %W[
	 #{pear_prefix}/.depdblock
	 #{pear_prefix}/.filemap
	 #{pear_prefix}/.depdb
	 #{pear_prefix}/.lock
	 ]
	 %W[
	 #{pear_prefix}/.channels
	 #{pear_prefix}/.channels/.alias
	 ].each do |f|
	 chmod 0755, f
	 pear_files.concat(Dir["#{f}/*"])
	 end
	 chmod 0644, pear_files
	 pecl_path = HOMEBREW_PREFIX/"lib/php/pecl"
	 ln_s pecl_path, prefix/"pecl" unless (prefix/"pecl").exist?
	 extension_dir = Utils.popen_read("#{bin}/php-config --extension-dir").chomp
	 php_basename = File.basename(extension_dir)
	 php_ext_dir = opt_prefix/"lib/php"/php_basename
	 pear_path = HOMEBREW_PREFIX/"share/pear@#{php_version}"
	 cp_r pkgshare/"pear/.", pear_path
	 {
	 "php_ini"  => etc/"php/#{php_version}/php.ini",
	 "php_dir"  => pear_path,
	 "doc_dir"  => pear_path/"doc",
	 "ext_dir"  => pecl_path/php_basename,
	 "bin_dir"  => opt_bin,
	 "data_dir" => pear_path/"data",
	 "cfg_dir"  => pear_path/"cfg",
	 "www_dir"  => pear_path/"htdocs",
	 "man_dir"  => HOMEBREW_PREFIX/"share/man",
	 "test_dir" => pear_path/"test",
	 "php_bin"  => opt_bin/"php",
	 }.each do |key, value|
	 value.mkpath if key =~ /(?<!bin|man)_dir$/
	 system bin/"pear", "config-set", key, value, "system"
	 end
	 system bin/"pear", "update-channels"
	 %w[
	 opcache
	 ].each do |e|
	 ext_config_path = etc/"php/#{php_version}/conf.d/ext-#{e}.ini"
	 extension_type = (e == "opcache") ? "zend_extension" : "extension"
	 if ext_config_path.exist?
	 inreplace ext_config_path,
	 /#{extension_type}=.*$/, "#{extension_type}=#{php_ext_dir}/#{e}.so"
	 else
	 ext_config_path.write <<~EOS
	 [#{e}]
	 #{extension_type}="#{php_ext_dir}/#{e}.so"
	 EOS
	 end
