name :
	 Apachetop
	 Resolver
homepage :
	 https://web.archive.org/web/20170809160553/freecode.com/projects/apachetop
url :
	 https://deb.debian.org/debian/pool/main/a/apachetop/apachetop_0.12.6.orig.tar.gz
description :
	 Top-like display of Apache log
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- src/resolver.h    2005-10-15 18:10:01.000000000 +0200
	 +++ src/resolver.h        2007-02-17 11:24:37.000000000
	 0100
	 @@ -10,8 +10,8 @@
	 {
	 public:
	 -	Resolver::Resolver(void);
	 -	Resolver::~Resolver(void);
	 +	Resolver(void);
	 +	~Resolver(void);
	 int add_request(char *request, enum resolver_action act);
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--with-logfile=/var/log/apache2/access_log"
	 system "make", "install"
