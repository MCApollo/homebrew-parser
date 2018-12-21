name :
	 Tidyp
homepage :
	 http://tidyp.com/
url :
	 https://github.com/downloads/petdance/tidyp/tidyp-1.04.tar.gz
description :
	 Validate and modify HTML
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 resource("manual").stage do
	 system "#{bin}/tidyp -xml-help > tidyp1.xml"
	 system "#{bin}/tidyp -xml-config > tidyp-config.xml"
	 system "/usr/bin/xsltproc tidyp1.xsl tidyp1.xml > tidyp.1"
	 man1.install gzip("tidyp.1")
