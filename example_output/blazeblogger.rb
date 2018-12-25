name :
	 Blazeblogger
homepage :
	 http://blaze.blackened.cz/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/blazeblogger/blazeblogger-1.2.0.tar.gz
description :
	 CMS for the command-line
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
	 ENV.deparallelize
	 system "make", "prefix=#{prefix}", "compdir=#{prefix}", "install"
