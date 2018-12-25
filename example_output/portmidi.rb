name :
	 Portmidi
homepage :
	 https://sourceforge.net/projects/portmedia/
url :
	 https://downloads.sourceforge.net/project/portmedia/portmidi/217/portmidi-src-217.zip
description :
	 Cross-platform library for real-time MIDI I/O
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 inreplace "pm_mac/Makefile.osx", "PF=/usr/local", "PF=#{prefix}"
	 include.mkpath
	 lib.mkpath
	 inreplace "pm_common/CMakeLists.txt",
	 "set(CMAKE_OSX_SYSROOT /Developer/SDKs/MacOSX10.5.sdk CACHE",
	 "set(CMAKE_OSX_SYSROOT /#{MacOS.sdk_path} CACHE"
	 system "make", "-f", "pm_mac/Makefile.osx"
	 system "make", "-f", "pm_mac/Makefile.osx", "install"
