name :
	 Kore
homepage :
	 https://kore.io/
url :
	 https://kore.io/releases/kore-3.1.0.tar.gz
description :
	 Web application framework for writing web APIs in C
build_deps :
link_deps :
	 :macos
	 openssl
optional_deps :
	 postgresql
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend "CFLAGS", "-I#{Formula["openssl"].opt_include}"
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib}"
	 inreplace "src/cli.c", "/usr/local/opt/openssl/include",
	 Formula["openssl"].opt_include
	 args = []
	 args << "PGSQL=1" if build.with? "postgresql"
	 system "make", "PREFIX=#{prefix}", "TASKS=1", *args
	 system "make", "install", "PREFIX=#{prefix}"
