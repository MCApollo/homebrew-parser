name :
	 Contacts
homepage :
	 http://www.gnufoo.org/contacts/contacts.html
url :
	 https://github.com/dhess/contacts/archive/4092a3c6615d7a22852a3bafc44e4aeeb698aa8f.tar.gz
description :
	 Command-line tool to access macOS's Contacts (formerly 'Address Book')
build_deps :
	 :xcode
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "SDKROOT=#{MacOS.sdk_path}"
	 bin.install "build/Deployment/contacts"
	 man1.install gzip("contacts.1")
