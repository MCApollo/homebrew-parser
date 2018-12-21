name :
	 Flactag
homepage :
	 https://flactag.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/flactag/v2.0.4/flactag-2.0.4.tar.gz
description :
	 Tag single album FLAC files with MusicBrainz CUE sheets
build_deps :
	 asciidoc
	 docbook-xsl
	 pkg-config
link_deps :
	 flac
	 jpeg
	 libdiscid
	 libmusicbrainz
	 neon
	 s-lang
	 unac
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/ed0e680/flactag/jpeg9.patch
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 ENV.append "LDFLAGS", "-liconv"
	 ENV.append "LDFLAGS", "-lFLAC"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
