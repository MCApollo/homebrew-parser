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
optional_deps :
conflicts :
resource :
	 []
	 []
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
	 end
	 inreplace "src/osdep/unix/ssl_unix.c", "#include <x509v3.h>\n#include <ssl.h>",
	 "#include <ssl.h>\n#include <x509v3.h>"
	 system "make", "oxp"
	 sbin.install "imapd/imapd", "ipopd/ipop2d", "ipopd/ipop3d"
	 bin.install "dmail/dmail", "mailutil/mailutil", "tmail/tmail"
	 doc.install Dir["docs/*"]
	 lib.install "c-client/c-client.a" => "libc-client.a"
	 (include + "imap").install "c-client/osdep.h", "c-client/linkage.h"
	 (include + "imap").install Dir["src/c-client/*.h", "src/osdep/unix/*.h"]
