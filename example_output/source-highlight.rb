name :
	 SourceHighlight
homepage :
	 https://www.gnu.org/software/src-highlite/
url :
	 https://ftp.gnu.org/gnu/src-highlite/source-highlight-3.1.8.tar.gz
description :
	 Source-code syntax highlighter
build_deps :
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-boost=#{Formula["boost"].opt_prefix}"
	 system "make", "install"
	 bash_completion.install "completion/source-highlight"
