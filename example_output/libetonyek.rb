name :
	 Libetonyek
homepage :
	 https://wiki.documentfoundation.org/DLP/Libraries/libetonyek
url :
	 https://dev-www.libreoffice.org/src/libetonyek/libetonyek-0.1.8.tar.xz
description :
	 Interpret and import Apple Keynote presentations
build_deps :
	 boost
	 pkg-config
link_deps :
	 glm
	 librevenge
	 mdds
optional_deps :
conflicts :
resource :
	 ['liblangtag']
	 ['https://bitbucket.org/tagoh/liblangtag/downloads/liblangtag-0.6.2.tar.bz2']
patches :
EOF_patch :
install :
	 resource("liblangtag").stage do
	 system "./configure", "--prefix=#{libexec}", "--enable-modules=no"
	 system "make"
	 system "make", "install"
	 end
	 ENV["LANGTAG_CFLAGS"] = "-I#{libexec}/include"
	 ENV["LANGTAG_LIBS"] = "-L#{libexec}/lib -llangtag -lxml2"
	 system "./configure", "--without-docs",
	 "--disable-dependency-tracking",
	 "--enable-static=no",
	 "--disable-werror",
	 "--disable-tests",
	 "--prefix=#{prefix}",
	 "--with-mdds=1.2"
	 system "make", "install"
