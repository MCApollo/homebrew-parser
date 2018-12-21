name :
	 Pulseaudio
homepage :
	 https://wiki.freedesktop.org/www/Software/PulseAudio/
url :
	 https://www.freedesktop.org/software/pulseaudio/releases/pulseaudio-12.2.tar.xz
description :
	 Sound system for POSIX OSes
build_deps :
	 pkg-config
link_deps :
	 json-c
	 libsndfile
	 libsoxr
	 libtool
	 openssl
	 speexdsp
	 glib
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-coreaudio-output
	 --disable-neon-opt
	 --disable-nls
	 --disable-x11
	 --with-mac-sysroot=#{MacOS.sdk_path}
	 --with-mac-version-min=#{MacOS.version}
	 ]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
