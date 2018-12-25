name :
	 Modules
homepage :
	 https://modules.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/modules/Modules/modules-4.1.4/modules-4.1.4.tar.bz2
description :
	 Dynamic modification of a user's environment via modulefiles
build_deps :
	 grep
link_deps :
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["coreutils"].opt_libexec/"gnubin"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-tcl=#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework
	 --datarootdir=#{share}
	 --disable-versioning
	 CPPFLAGS=-DUSE_INTERP_ERRORLINE
	 ]
	 args << "--without-x" if build.without? "x11"
	 system "./configure", *args
	 system "make", "install"
