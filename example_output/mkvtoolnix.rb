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
	 gettext
	 qt
	 cmark
conflicts :
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
