name :
	 Dos2unix
homepage :
	 https://waterlan.home.xs4all.nl/dos2unix.html
url :
	 https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.0.tar.gz
description :
	 Convert text between DOS, UNIX, and Mac formats
build_deps :
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 prefix=#{prefix}
	 CC=#{ENV.cc}
	 CPP=#{ENV.cc}
	 CFLAGS=#{ENV.cflags}
	 install
	 ]
	 if build.without? "gettext"
	 args << "ENABLE_NLS="
	 else
	 gettext = Formula["gettext"]
	 args << "CFLAGS_OS=-I#{gettext.include}"
	 args << "LDFLAGS_EXTRA=-L#{gettext.lib} -lintl"
	 end
	 system "make", *args
