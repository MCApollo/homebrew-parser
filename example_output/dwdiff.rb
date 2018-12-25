name :
	 Dwdiff
homepage :
	 https://os.ghalkes.nl/dwdiff.html
url :
	 https://os.ghalkes.nl/dist/dwdiff-2.1.1.tar.bz2
description :
	 Diff that operates at the word level
build_deps :
link_deps :
	 gettext
	 icu4c
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 gettext = Formula["gettext"]
	 icu4c = Formula["icu4c"]
	 ENV.append "CFLAGS", "-I#{gettext.include} -I#{icu4c.include}"
	 ENV.append "LDFLAGS", "-L#{gettext.lib} -L#{icu4c.lib} -lintl"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 (man/"nl").rmtree
	 (man/"nl.UTF-8").rmtree
	 (share/"locale/nl").rmtree
