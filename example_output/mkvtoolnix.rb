name :
	 Mkvtoolnix
homepage :
	 https://www.bunkus.org/videotools/mkvtoolnix/
url :
	 https://mkvtoolnix.download/sources/mkvtoolnix-28.2.0.tar.xz
description :
	 Matroska media files manipulation tools
build_deps :
	 docbook-xsl
	 pkg-config
	 pugixml
link_deps :
	 ruby
	 boost
	 flac
	 libebml
	 libmagic
	 libmatroska
	 libogg
	 libvorbis
	 cmark
optional_deps :
	 gettext
	 qt
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 features = %w[flac libmagic libogg libvorbis libebml libmatroska]
	 extra_includes = ""
	 extra_libs = ""
	 features.each do |feature|
	 extra_includes << "#{Formula[feature].opt_include};"
	 extra_libs << "#{Formula[feature].opt_lib};"
	 end
	 extra_includes.chop!
	 extra_libs.chop!
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --with-boost=#{Formula["boost"].opt_prefix}
	 --with-docbook-xsl-root=#{Formula["docbook-xsl"].opt_prefix}/docbook-xsl
	 --with-extra-includes=#{extra_includes}
	 --with-extra-libs=#{extra_libs}
	 ]
	 if build.with?("qt")
	 qt = Formula["qt"]
	 args << "--with-moc=#{qt.opt_bin}/moc"
	 args << "--with-uic=#{qt.opt_bin}/uic"
	 args << "--with-rcc=#{qt.opt_bin}/rcc"
	 args << "--enable-qt"
	 else
	 args << "--disable-qt"
	 end
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "rake", "-j#{ENV.make_jobs}"
	 system "rake", "install"
