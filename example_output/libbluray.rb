name :
	 Libbluray
homepage :
	 https://www.videolan.org/developers/libbluray.html
url :
	 https://download.videolan.org/pub/videolan/libbluray/1.0.2/libbluray-1.0.2.tar.bz2
description :
	 Blu-Ray disc playback library for media players like VLC
build_deps :
	 ant
	 pkg-config
link_deps :
	 :java
	 fontconfig
	 freetype
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 ENV.append_to_cflags "-D_DARWIN_C_SOURCE"
	 args = %W[--prefix=#{prefix} --disable-dependency-tracking]
	 system "./bootstrap" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
