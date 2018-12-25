name :
	 TigerVnc
homepage :
	 https://tigervnc.org/
url :
	 https://github.com/TigerVNC/tigervnc/archive/v1.9.0.tar.gz
description :
	 High-performance, platform-neutral implementation of VNC
build_deps :
	 cmake
link_deps :
	 fltk
	 gettext
	 jpeg-turbo
	 :x11
	 gnutls
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 turbo = Formula["jpeg-turbo"]
	 args = std_cmake_args + %W[
	 -DJPEG_INCLUDE_DIR=#{turbo.include}
	 -DJPEG_LIBRARY=#{turbo.lib}/libjpeg.dylib
	 .
	 ]
	 system "cmake", *args
	 system "make", "install"
