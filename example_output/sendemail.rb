name :
	 Sendemail
homepage :
	 http://caspian.dotconf.net/menu/Software/SendEmail/
url :
	 http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v1.56.tar.gz
description :
	 Email program for sending SMTP mail
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/mogaal/sendemail/e785a6d284884688322c9b39c0f64e20a43ea825/debian/patches/fix_ssl_version.patch
EOF_patch :
install :
	 bin.install "sendEmail"
