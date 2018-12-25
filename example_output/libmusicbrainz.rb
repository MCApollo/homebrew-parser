name :
	 Libmusicbrainz
homepage :
	 https://musicbrainz.org/doc/libmusicbrainz
url :
	 https://github.com/metabrainz/libmusicbrainz/releases/download/release-5.1.0/libmusicbrainz-5.1.0.tar.gz
description :
	 MusicBrainz Client Library
build_deps :
	 cmake
link_deps :
	 neon
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 neon = Formula["neon"]
	 neon_args = %W[-DNEON_LIBRARIES:FILEPATH=#{neon.lib}/libneon.dylib
	 -DNEON_INCLUDE_DIR:PATH=#{neon.include}/neon]
	 system "cmake", ".", *(std_cmake_args + neon_args)
	 system "make", "install"
