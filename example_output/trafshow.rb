name :
	 Trafshow
homepage :
	 https://web.archive.org/web/20130707021442/soft.risp.ru/trafshow/index_en.shtml
url :
	 https://pkg.freebsd.org/ports-distfiles/trafshow-5.2.3.tgz
description :
	 Continuous network traffic display
build_deps :
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/be6fd4a/trafshow/patch-#{name}
	 https://raw.githubusercontent.com/Homebrew/formula-patches/7ad7c77/trafshow/patch-pcap-version-sierra.diff
EOF_patch :
install :
	 cp Dir["#{Formula["libtool"].opt_pkgshare}/*/config.{guess,sub}"], buildpath
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-slang"
	 system "make"
	 bin.install "trafshow"
	 man1.install "trafshow.1"
	 etc.install ".trafshow" => "trafshow.default"
