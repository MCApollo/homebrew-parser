name :
	 FseventsTools
homepage :
	 https://geoff.greer.fm/fsevents/
url :
	 https://geoff.greer.fm/fsevents/releases/fsevents-tools-1.0.0.tar.gz
description :
	 Command-line utilities for the FSEvents API
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
