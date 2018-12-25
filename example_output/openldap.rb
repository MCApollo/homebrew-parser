name :
	 Openldap
homepage :
	 https://www.openldap.org/software/
url :
	 https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.46.tgz
description :
	 Open source suite of directory software
build_deps :
link_deps :
	 openssl
optional_deps :
	 berkeley-db@4
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --localstatedir=#{var}
	 --enable-accesslog
	 --enable-auditlog
	 --enable-constraint
	 --enable-dds
	 --enable-deref
	 --enable-dyngroup
	 --enable-dynlist
	 --enable-memberof
	 --enable-ppolicy
	 --enable-proxycache
	 --enable-refint
	 --enable-retcode
	 --enable-seqmod
	 --enable-translucent
	 --enable-unique
	 --enable-valsort
	 ]
	 args << "--enable-bdb=no" << "--enable-hdb=no" if build.without? "berkeley-db@4"
	 args << "--enable-sssvlv=yes" if build.with? "sssvlv"
	 system "./configure", *args
	 system "make", "install"
	 (var+"run").mkpath
	 chmod 0755, Dir[etc/"openldap/*"]
	 chmod 0755, Dir[etc/"openldap/schema/*"]
