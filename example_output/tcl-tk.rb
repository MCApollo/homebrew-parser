name :
	 TclTk
homepage :
	 https://www.tcl.tk/
url :
	 https://downloads.sourceforge.net/project/tcl/Tcl/8.6.8/tcl8.6.8-src.tar.gz
description :
	 Tool Command Language
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/macports/macports-ports/0a883ad388b/x11/tk/files/patch-macosx-tkMacOSXXStubs.c.diff
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --enable-threads
	 --enable-64bit
	 ]
	 cd "unix" do
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 system "make", "install-private-headers"
	 ln_s bin/"tclsh#{version.to_f}", bin/"tclsh"
