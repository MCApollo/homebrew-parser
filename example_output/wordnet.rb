name :
	 Wordnet
homepage :
	 https://wordnet.princeton.edu/
url :
	 http://wordnetcode.princeton.edu/3.0/WordNet-3.0.tar.bz2
description :
	 Lexical database for the English language
build_deps :
link_deps :
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 (prefix/"dict").install resource("dict")
	 ENV.append_to_cflags "-DUSE_INTERP_RESULT"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-tcl=#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework",
	 "--with-tk=#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework"
	 ENV.deparallelize
	 system "make", "install"
