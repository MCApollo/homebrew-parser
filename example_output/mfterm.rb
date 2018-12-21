name :
	 Mfterm
homepage :
	 https://github.com/4ZM/mfterm
url :
	 https://github.com/4ZM/mfterm/releases/download/v1.0.7/mfterm-1.0.7.tar.gz
description :
	 Terminal for working with Mifare Classic 1-4k Tags
build_deps :
link_deps :
	 libnfc
	 libusb
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend "CPPFLAGS", "-I#{Formula["openssl"].opt_include}"
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib}"
	 if build.head?
	 chmod 0755, "./autogen.sh"
	 system "./autogen.sh"
