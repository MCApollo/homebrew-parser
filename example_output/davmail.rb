name :
	 Davmail
homepage :
	 https://davmail.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/davmail/davmail/4.9.0/davmail-4.9.0-2652.zip
description :
	 POP/IMAP/SMTP/Caldav/Carddav/LDAP exchange gateway
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
	 libexec.install Dir["*"]
	 bin.write_jar_script libexec/"davmail.jar", "davmail", "-Djava.awt.headless=true"
