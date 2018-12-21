name :
	 Streamripper
homepage :
	 https://streamripper.sourceforge.io/
url :
	 https://downloads.sourceforge.net/sourceforge/streamripper/streamripper-1.64.6.tar.gz
description :
	 Separate tracks via Shoutcasts title-streaming
build_deps :
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags ENV.cppflags
	 chmod 0755, "./install-sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking"
	 system "make", "install"
