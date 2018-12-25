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
optional_deps :
conflicts :
resource :
	 ['manual']
	 ['https://raw.githubusercontent.com/petdance/tidyp/6a6c85bc9cb089e343337377f76127d01dd39a1c/htmldoc/tidyp1.xsl']
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
	 end
