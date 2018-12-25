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
optional_deps :
conflicts :
resource :
	 ['tcllib', 'tk']
	 ['https://downloads.sourceforge.net/project/tcllib/tcllib/1.18/tcllib-1.18.tar.gz', 'https://downloads.sourceforge.net/project/tcl/Tcl/8.6.8/tk8.6.8-src.tar.gz', 'https://raw.githubusercontent.com/macports/macports-ports/0a883ad388b/x11/tk/files/patch-macosx-tkMacOSXXStubs.c.diff']
patches :
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
	 end
	 ENV.prepend_path "PATH", bin
	 resource("tk").stage do
	 cd "unix" do
	 system "./configure", *args, "--enable-aqua=yes",
	 "--without-x", "--with-tcl=#{lib}"
	 system "make"
	 system "make", "install"
	 system "make", "install-private-headers"
	 ln_s bin/"wish#{version.to_f}", bin/"wish"
	 end
	 end
	 resource("tcllib").stage do
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
	 end
