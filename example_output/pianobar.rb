name :
	 Pianobar
homepage :
	 https://github.com/PromyLOPh/pianobar/
url :
	 https://6xq.net/pianobar/pianobar-2018.06.22.tar.bz2
description :
	 Command-line player for https://pandora.com
build_deps :
	 pkg-config
link_deps :
	 faad2
	 ffmpeg
	 gnutls
	 json-c
	 libao
	 libgcrypt
	 mad
conflicts :
patches :
EOF_patch :
install :
	 ENV["CFLAGS"] = "-O2 -DNDEBUG " +
	 "-std=c99 " +
	 "#{ENV.cppflags} #{ENV.ldflags}"
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
	 prefix.install "contrib"
