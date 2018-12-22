name :
	 Dc3dd
homepage :
	 https://sourceforge.net/projects/dc3dd/
url :
	 https://downloads.sourceforge.net/project/dc3dd/dc3dd/7.2.646/dc3dd%207.2.646/dc3dd-7.2.646.zip
description :
	 Patched GNU dd that is intended for forensic acquisition of data
build_deps :
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 system "unzip dc3dd-#{version}.zip ; true"
	 cd "dc3dd-#{version}" do
	 ENV.prepend_create_path "PERL5LIB", buildpath/"gettext-pm/lib/perl5"
	 resource("gettext-pm").stage do
	 inreplace "Makefile.PL", "$libs = \"-lintl\"",
	 "$libs = \"-L/usr/local/opt/gettext/lib -lintl\""
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{buildpath}/gettext-pm"
	 system "make"
	 system "make", "install"
	 end
	 inreplace "lib/vasnprintf.c",
	 "
	 "
	 chmod 0555, ["build-aux/install-sh", "configure"]
	 args = %W[--disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --infodir=#{info}]
	 args << "gl_cv_func_stpncpy=yes" if MacOS.version >= :lion
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 prefix.install %w[Options_Reference.txt Sample_Commands.txt]
	 end
