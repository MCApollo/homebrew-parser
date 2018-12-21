name :
	 VorbisTools
homepage :
	 https://github.com/xiph/vorbis-tools
url :
	 https://downloads.xiph.org/releases/vorbis/vorbis-tools-1.4.0.tar.gz
description :
	 Ogg Vorbis CODEC tools
build_deps :
	 pkg-config
link_deps :
	 flac
	 libao
	 libogg
	 libvorbis
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT") if MacOS.version == :yosemite
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-nls
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
