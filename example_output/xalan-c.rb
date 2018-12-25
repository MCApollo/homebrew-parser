name :
	 XalanC
homepage :
	 https://xalan.apache.org/xalan-c/
url :
	 https://www.apache.org/dyn/closer.cgi?path=xalan/xalan-c/sources/xalan_c-1.11-src.tar.gz
description :
	 XSLT processor
build_deps :
link_deps :
	 xerces-c
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/master/xalan-c/xerces-char16.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/master/xalan-c/locator-system-id.patch
EOF_patch :
install :
	 ENV.cxx11
	 ENV.deparallelize
	 ENV["XALANCROOT"] = "#{buildpath}/c"
	 ENV["XALAN_LOCALE_SYSTEM"] = "inmem"
	 ENV["XALAN_LOCALE"] = "en_US"
	 cd "c" do
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 rm Dir["#{lib}/*.dylib.*"]
	 end
