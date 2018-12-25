name :
	 Log4shib
homepage :
	 https://wiki.shibboleth.net/confluence/display/OpenSAML/log4shib
url :
	 https://shibboleth.net/downloads/log4shib/1.0.9/log4shib-1.0.9.tar.gz
description :
	 Forked version of log4cpp for the Shibboleth project
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
	 system "make", "install"
