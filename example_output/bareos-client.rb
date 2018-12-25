name :
	 BareosClient
homepage :
	 https://www.bareos.org/
url :
	 https://github.com/bareos/bareos/archive/Release/17.2.7.tar.gz
description :
	 Client for Bareos (Backup Archiving REcovery Open Sourced)
build_deps :
link_deps :
	 openssl
	 readline
optional_deps :
conflicts :
	 bacula-fd
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-working-dir=#{var}/lib/bareos",
	 "--with-archivedir=#{var}/bareos",
	 "--with-confdir=#{etc}/bareos",
	 "--with-configtemplatedir=#{lib}/bareos/defaultconfigs",
	 "--with-scriptdir=#{lib}/bareos/scripts",
	 "--with-plugindir=#{lib}/bareos/plugins",
	 "--with-fd-password=XXX_REPLACE_WITH_CLIENT_PASSWORD_XXX",
	 "--with-mon-fd-password=XXX_REPLACE_WITH_CLIENT_MONITOR_PASSWORD_XXX",
	 "--with-basename=XXX_REPLACE_WITH_LOCAL_HOSTNAME_XXX",
	 "--with-hostname=XXX_REPLACE_WITH_LOCAL_HOSTNAME_XXX",
	 "--with-python",
	 "--enable-client-only"
	 rm "platforms/osx/Makefile"
	 system "make", "install"
	 unless (etc/"bareos/bareos-fd.d").exist?
	 system lib/"bareos/scripts/bareos-config", "deploy_config",
	 lib/"bareos/defaultconfigs", etc/"bareos", "bareos-fd"
	 system lib/"bareos/scripts/bareos-config", "deploy_config",
	 lib/"bareos/defaultconfigs", etc/"bareos", "bconsole"
	 end
