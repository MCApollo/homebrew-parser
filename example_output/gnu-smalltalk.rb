name :
	 GnuSmalltalk
homepage :
	 http://smalltalk.gnu.org/
url :
	 https://ftp.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.xz
description :
	 GNU Smalltalk interpreter and image
build_deps :
	 autoconf
	 automake
	 gawk
	 pkg-config
link_deps :
	 gdbm
	 gnutls
	 libffi
	 libsigsegv
	 libtool
	 readline
	 :x11
optional_deps :
	 glew
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.m32 unless MacOS.prefer_64_bit?
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 ENV["ac_cv_search_clock_gettime"] = "no"
	 end
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-lispdir=#{elisp}
	 --disable-gtk
	 --with-readline=#{Formula["readline"].opt_lib}
	 ]
	 if build.without? "tcltk"
	 args << "--without-tcl" << "--without-tk" << "--without-x"
	 end
	 args << "--disable-generational-gc" unless MacOS.prefer_64_bit?
	 system "autoreconf", "-ivf"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
