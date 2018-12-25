name :
	 Jack
homepage :
	 http://jackaudio.org
url :
	 http://jackaudio.org/downloads/jack-audio-connection-kit-0.125.0.tar.gz
description :
	 Audio Connection Kit
build_deps :
	 pkg-config
link_deps :
	 berkeley-db
	 libsamplerate
	 libsndfile
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 sdk = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 inreplace Dir["drivers/coreaudio/Makefile.{am,in}"],
	 "/System/Library/Frameworks/Carbon.framework/Headers/Carbon.h",
	 "#{sdk}/System/Library/Frameworks/Carbon.framework/Headers/Carbon.h"
	 inreplace "configure", "-mmacosx-version-min=10.4",
	 "-mmacosx-version-min=#{MacOS.version}"
	 ENV["LINKFLAGS"] = ENV.ldflags
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
