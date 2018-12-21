name :
	 Devtodo
homepage :
	 https://swapoff.org/devtodo.html
url :
	 https://swapoff.org/files/devtodo/devtodo-0.1.20.tar.gz
description :
	 Command-line task lists
build_deps :
link_deps :
	 readline
conflicts :
	 todoman
patches :
EOF_patch :
	 --- a/util/XML.cc	Mon Dec 10 22:26:55 2007
	 +++ b/util/XML.cc	Mon Dec 10 22:27:07 2007
	 @@ -49,7 +49,7 @@ void XML::init() {
	 // Only initialise scanners once
	 if (!initialised) {
	 // <?xml version="1.0" encoding="UTF-8" standalone="no"?>
	 -		xmlScan.addPattern(XmlDecl, "<\\?xml.*?>[[:space:]]*");
	 +		xmlScan.addPattern(XmlDecl, "<\\?xml.*\\?>[[:space:]]*");
	 xmlScan.addPattern(XmlCommentBegin, "<!--");
	 xmlScan.addPattern(XmlBegin, "<[a-zA-Z0-9_-]+"
	 "([[:space:]]+[a-zA-Z_0-9-]+=(([/a-zA-Z_0-9,.]+)|(\"[^\"]*\")|('[^']*')))"
install :
	 mv "util/Regex.h", "util/Regex.hh"
	 inreplace ["util/Lexer.h", "util/Makefile.in", "util/Regex.cc"],
	 "Regex.h", "Regex.hh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
	 doc.install "contrib"
