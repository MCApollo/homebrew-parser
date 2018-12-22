name :
	 Xdotool
homepage :
	 https://www.semicomplete.com/projects/xdotool/
url :
	 https://github.com/jordansissel/xdotool/archive/v3.20160805.1.tar.gz
description :
	 Fake keyboard/mouse input and window management for X
build_deps :
	 pkg-config
link_deps :
	 libxkbcommon
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? &&
	 MacOS::Xcode.version >= "8.0"
	 ENV.delete("SDKROOT")
	 end
	 system "make", "PREFIX=#{prefix}", "INSTALLMAN=#{man}", "install"
