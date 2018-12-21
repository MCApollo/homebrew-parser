name :
	 ImapUw
homepage :
	 https://www.washington.edu/imap/
url :
	 https://mirrorservice.org/sites/ftp.cac.washington.edu/imap/imap-2007f.tar.gz
description :
	 University of Washington IMAP toolkit
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 inreplace "Makefile" do |s|
	 s.gsub! "SSLINCLUDE=/usr/include/openssl",
	 "SSLINCLUDE=#{Formula["openssl"].opt_include}/openssl"
	 s.gsub! "SSLLIB=/usr/lib",
	 "SSLLIB=#{Formula["openssl"].opt_lib}"
	 s.gsub! "-DMAC_OSX_KLUDGE=1", ""
